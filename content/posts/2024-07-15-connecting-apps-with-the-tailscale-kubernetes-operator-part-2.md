---
date: '2024-07-15T12:00:00Z'
slug: connecting-apps-with-the-tailscale-kubernetes-operator-part-2
title: Connecting Apps with the Tailscale Kubernetes Operator - Part 2
---

In [Part 1](/2024/02/23/exploring-the-tailscale-kubernetes-operator-part1/), I explored installing the Tailscale (TS) K8S operator and adding an Ingress object to make a K8S Service available to the TS network over HTTP.

In this post, I want to cover different Egress and Ingress options and ways to connect apps on the TS network.

For more context, while I've been experimenting with kind and a virtual Kubernetes (K8S) cluster, I run a personal server running at home with plenty of resources and a virtual server that hosts my public web apps. Being able to connect the two servers over TS is one of my goals. It allows me to do more permanent and resource intensive things on my personal server, but also make them available publicly when I want.

For example:
![](/pic/2024-07-15-networks.png)

**Caveat: Under Active Development**

The TS K8S Operator is under active development and some of these capabilities were add in [v1.66](https://tailscale.com/changelog#2024-05-15). Make sure you are running the latest version. 

There is even a Helm chart now for easier updating - [https://tailscale.com/kb/1236/kubernetes-operator#helm](https://tailscale.com/kb/1236/kubernetes-operator#helm)

## Exposing TS Apps to your Cluster

To expose existing TS Apps to your K8S cluster, you can use the ExternalName Service, which creates an TS Pod to proxy traffic.

For example, to expose the Home Server to K8S, you could create this Service:

```yaml
---
apiVersion: v1
kind: Service
metadata:
  name: home-server
  annotations:
    tailscale.com/tailnet-ip: "100.X.X.1"
spec:
  externalName: placeholder
  type: ExternalName
```

Then you would get a K8S Service and could curl `ts-home-server-lmc8s.tailscale.svc.cluster.local` within your cluster:

```shell
$ kubectl get service tower
NAME          TYPE           CLUSTER-IP  EXTERN   
home-server   ExternalName   <none>      ts-home-server-lmc8s.tailscale.svc.cluster.local
```

## Now with TS DNS names

Now with v1.66 of the Operator, using full TS domain names are supported instead of TS IPs, by running a TS managed DNS server. [Official docs here](https://tailscale.com/kb/1236/kubernetes-operator#exposing-a-tailnet-service-to-your-kubernetes-cluster-cluster-egress).

First, add the DNS component:

```yaml
---
apiVersion: tailscale.com/v1alpha1
kind: DNSConfig
metadata:
  name: ts-dns
spec:
  nameserver:
    image:
      repo: tailscale/k8s-nameserver
      tag: unstable
```

Then get the Pod IP and add it to your Cluster DNS config. In my K8S setup, I use coredns.

```shell
$ kubectl get dnsconfig ts-dns -o json | jq .status.nameserver.ip -r
10.43.239.128

$ kubectl edit configmaps -n kube-system coredns
...
ts.net {
	errors
	cache 30
	forward . 10.43.239.128
}
...

$ kubectl rollout restart -n kube-system deployment coredns
```

Now you can create your Service with a FQDN. And another new feature recently
added is the `tailscale.com/hostname` annotation, that allows you to name the TS
Proxy instead of using a random prefix, to keep things more organized on the TS
side.

```yaml
---
apiVersion: v1
kind: Service
metadata:
  name: homeserver-fqdn
  annotations:
    tailscale.com/tailnet-fqdn: "homeserver.bee-haka.ts.net"
	tailscale.com/hostname: "homeserver-fqdn"
spec:
  externalName: placeholder
  type: ExternalName
```

## Creating a TS Proxy with Subnet Routes

Another TS feature is subnet routing; sharing entire CIDR routes to TS. 

In my example, even though I have my Home Server directly shared on TS, I can also get to it via the Apple TV that is sharing the `192.168.1.X/24` route. [Apple TV subnet routing release here](https://www.youtube.com/watch?v=hYd5etBpsO0).

To create a TS Proxy with subnet routings, one of the other new objects is a ProxyClass, for configuring the TS Proxy:

```yaml
---
apiVersion: tailscale.com/v1alpha1
kind: ProxyClass
metadata:
	name: acceptroutes
spec:
	tailscale:
		acceptRoutes: true
---
apiVersion: v1
kind: Service
metadata:
  name: home-server-via-apple-tv
  labels:
    tailscale.com/proxy-class: acceptroutes
  annotations:
    tailscale.com/tailnet-ip: "192.168.1.1"
spec:
  externalName: placeholder
  type: ExternalName
```

## Expose HTTPS services with TS SSL

Lastly, you can also expose TS Apps with FQDNs and automatically generated LetsEncrypt certs. I believe you could generate and download the certs manually before, this is another convenient primitive for apps that need to know their address.

For example, given an existing "registry" Service, you can expose it with an Ingress and tls params.

```yaml
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: registry
spec:
  defaultBackend:
    service:
      name: registry
      port:
        number: 80
  ingressClassName: tailscale
  tls:
    - hosts:
        - registry
```

```shell
$ kubectl get ingress
NAME       CLASS       HOSTS   ADDRESS                                 PORTS     AGE
nginx      tailscale   *       default-nginx-ingress.bee-hake.ts.net   80        3d3h
registry   tailscale   *       registry.bee-hake.ts.net                80, 443   3d2h
```

So this is the Docker Registry service that I'm running, so I can build Docker Images on my Home Server and then use them in K8S. It's more convenient than other ways to push a Docker Image to a central shared point on TS.

Overall, these are useful primitives for bi-directional sharing between the TS network and K8S. The TS Operator has made it easier to connect my apps together securely and I'll continue to watch for new capabilties!