---
title: Exploring the Tailscale Kubernetes Operator - Part 1
date: 2024-02-23 12:00 PST
---

I’m a big fan of [Tailscale](http://tailscale.com) (TS) and the ease of use it brings to using Wireguard to securely connect servers and apps. They’ve recently been working on a [Kubernetes Operator](https://github.com/tailscale/tailscale/tree/main/cmd/k8s-operator) that makes it easy to integrate TS into Kubernetes (K8S). As I’ve personally been moving my internal self-hosted apps and public web apps to K8S, I’ve been curious to integrate the two.

Two big features I’m interested in and I'll cover today:

- securely connecting to the K8S apiserver over TS, for managing K8S
- connecting apps over TS, for internal access via the TS network

Preface:

- I'm doing this all locally via [kind](https://kind.sigs.k8s.io), but it should work on any K8S setup
- Tailscale has this all documented here as well [https://tailscale.com/kb/1236/kubernetes-operator](https://tailscale.com/kb/1236/kubernetes-operator)

### Access via Tailscale

Assuming you already have working k8s cluster and context, you need to install the TS Operator. Installing via Helm is also an option, but I chose static files.

Get the latest development version:

```
wget https://raw.githubusercontent.com/tailscale/tailscale/main/cmd/k8s-operator/deploy/manifests/operator.yaml
```

Create a new TS Oauth app, for the Operator: 
[https://login.tailscale.com/admin/settings/oauth](https://login.tailscale.com/admin/settings/oauth)

Then configure the OAuth secret in the file:

```
client_id: XXXXXXXXXX
client_secret: tskey-XXXXX
```

I'm also also choosing to use the TS proxy in auth mode, which "impersonates requests from tailnet to the Kubernetes API server". This requires some additional configuration, but seems a bit more flexible versus the "noauth" mode, which only proxies requests and requires a bit more lower-level work to have your TLS certs configured correctly.

Configure the Operator section in the file:

```
name: APISERVER_PROXY 
value: "true"
```

Apply the file to your cluster

```
$ k apply -f operator.yaml
namespace/tailscale created
secret/operator-oauth created
serviceaccount/operator created
serviceaccount/proxies created
customresourcedefinition.apiextensions.k8s.io/connectors.tailscale.com created
customresourcedefinition.apiextensions.k8s.io/proxyclasses.tailscale.com created
clusterrole.rbac.authorization.k8s.io/tailscale-operator created
clusterrolebinding.rbac.authorization.k8s.io/tailscale-operator created
role.rbac.authorization.k8s.io/operator created
role.rbac.authorization.k8s.io/proxies created
rolebinding.rbac.authorization.k8s.io/operator created
rolebinding.rbac.authorization.k8s.io/proxies created
deployment.apps/operator created
ingressclass.networking.k8s.io/tailscale created
```

Then for auth proxy, apply the RBAC roles in the most insecure fashion:

```
curl -s https://raw.githubusercontent.com/tailscale/tailscale/main/cmd/k8s-operator/deploy/manifests/authproxy-rbac.yaml | k apply -f -
clusterrole.rbac.authorization.k8s.io/tailscale-auth-proxy unchanged
clusterrolebinding.rbac.authorization.k8s.io/tailscale-auth-proxy unchanged
```

I'm using my own private tailscale network, so auth-ing myself with all privileges is easiest:

```
kubectl create clusterrolebinding askedrelic --user="askedrelic@github" --clusterrole=cluster-admin
```

Lastly, you can use Tailscale to create your K8S context and use it!

```
tailscale configure kubeconfig tailscale-operator
```

You should have K8S access using the TS context now!

There are other options for getting secure access to your apiserver via ssh forwarding or tailscale subnets on the server itself, but consolidating more configuration like this into K8S makes sense for me.

### Connecting to Internal Apps via Tailscale

Lets run an app (only internally available to K8S) and connect to it over Tailscale. I'll use the default nginx image:

```
k create deployment nginx --image=nginx
```

There are several options TS exposes. The first is creating via a Service:

```
kind: Service
apiVersion: v1
metadata:
  name: nginx-ts
spec:
  type: LoadBalancer
  loadBalancerClass: tailscale
  selector:
    app: nginx
  ports:
  - name: http
    port: 80
    protocol: TCP
    targetPort: 80
```

Assuming that creates successfully, you can get the Service details:

```
$ k get service nginx-ts
NAME       TYPE           CLUSTER-IP      EXTERNAL-IP                                       PORT(S)        AGE
nginx-ts   LoadBalancer   10.96.207.167   100.121.9.15,default-nginx-ts-2.bee-hake.ts.net   80:30697/TCP   9s
```

And it should be available via the TS IP:

```
$ curl 100.121.9.15
...
<h1>Welcome to nginx!</h1>
...
```

or generated TS device name, assuming you have TS DNS enabled locally:

```
$ curl default-nginx-ts-2.bee-hake.ts.net
```

The other option is via Ingress, which can make the app available via HTTPS with a Lets Encrypt generated cert, assuming you have HTTPS enabled in your TS settings.

```
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: nginx-ts
spec:
  defaultBackend:
    service:
      name: nginx
      port:
        number: 80
  ingressClassName: tailscale
---
apiVersion: v1
kind: Service
metadata:
  name: nginx-ts
spec:
  ports:
  - name: http
    port: 80
    targetPort: 80
  selector:
    app: nginx
  type: ClusterIP
```

While testing this, Service/Ingress changes didn't seem to be reconciled by the Operator, so delete/re-creating seems required for now.

And now it should be available via HTTPS:

```
$ curl https://default-nginx-ingress.bee-hake.ts.net
...
<h1>Welcome to nginx!</h1>
...
```

### Convience Delivered Securely

Overall, the Operator has worked smoothly for me in testing and it has made things more convenient and secure for my network.

In Part 2, I'll explore connecting apps together over the TS network.