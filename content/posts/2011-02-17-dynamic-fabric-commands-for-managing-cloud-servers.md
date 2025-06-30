---
date: '2011-02-17T23:07:54Z'
slug: dynamic-fabric-commands-for-managing-cloud-servers
title: Dynamic Fabric Commands For Managing Cloud Servers
---


Fabric is a Python CLI
tool for interacting with remote servers, that I've been pushing at work the
last few months. It's great for organizing simple tasks to run locally or
remotely, this blog is [even being deployed using Fabric][1]
currently! It's a great tool.

The two main ideas of Fabric are that you have hosts and tasks you apply to
those hosts. Fabric uses `fabfile.py` as its default instruction file, similar
to a Rakefile or makefile. From a command line, you can call multiple tasks on
a host and they will get applied in the order you called them.  Hosts can be
defined staticly in the fabfile through a variety of methods, but this gets
hard once you have multiple hosts that can change easily with cloud
computing/VPS solutions. I found a straight foward way to handle this was to
have a task which defines which host I want to use, then the actual task I want
to run on that host; calling `fab production task1` or `fab staging task1` to
run task1 on my production or staging server.

This is great for 1-2 static servers, but becomes more work to manage when in a
dynamic cloud based server environment. I wanted a better solution, but Fabric
doesn't easily fit to this pattern. I found [dynamic tasks had been attempted
before][2] before with Fabric and used that idea as a start.
Here is what I came up with to create dynamic host tasks:

```python
import sys
from fabric.api import *

### Before
def prod():
    """HOST: prod"""
    env.hosts = ['user@foo.com']

def staging():
    """HOST: staging"""
    env.hosts = ['user@bar.com']

### After
hosts = {
    'prod'    : ['user@foo.com'],
    'staging' : ['user@bar.com'],
}

def _createHost(hostName, hostList):
    moduleObj = sys.modules[__name__]
    def setHost():
        env.hosts = hostList
    #Doc string is readonly during creation?
    setHost.__doc__ = 'HOST: %s ' % hostName
    setattr(moduleObj, hostName, setHost)

for host, hostList in hosts.iteritems():
    _createHost(host, hostList)

def test():
    run('ls')
```

So when Fabric runs, each host task is added as a function on the Fabric module
and available to call.

Now my current blog server is hosted on Linode and a good portion of my work
servers are on Linode as well. Linode has a decent JSON api, and [Python
library][3] using that api, which I can use to used to get a list of
all currently running Linode servers and their IPs. Extending my code above,
you can get a dynamic list of your Linode servers in Fabric!

```python
def _createHost(hostName, hostSize, hostList):
    moduleObj = sys.modules[__name__]
    def setHost():
        env.hosts = hostList
    #Doc string is readonly during creation?
    setHost.__doc__ = 'HOST: %sMB' % hostSize
    setattr(moduleObj, hostName, setHost)

def _generateLinodeHosts():
    sys.path.append('.')
    # Import api locally to hide from Fabric
    import api as linodeApi
    LINODE_KEY = "LINODE_KEY_GOES_HERE"
    linode = linodeApi.Api(LINODE_KEY)
    linodeList = [(x['LINODEID'],x['LABEL'], x['TOTALRAM']) for x in linode.linode_list()]
    for server in linodeList:
        ipList = linode.linode_ip_list(LinodeID=int(server[0]))
        publicIps = [x['IPADDRESS'] for x in ipList if x['ISPUBLIC']]
        _createHost(server[1], server[2], [publicIps[0]])
_generateLinodeHosts()

def test():
    run('ls')
```

You will want to add caching around your Linode calls, otherwise every usage of
Fabric will generate a dozen api calls and be incredibly slow. I used pickle in
my production setup, to save the Linode server list until I wanted to refresh
it. This idea could easily be ported to Amazon EC2 or Slicehost or any other
cloud provider, so happy hacking!

You can view all of this code on github [here][4].

[1]: https://github.com/askedrelic/asktherelic.com/blob/master/fabfile.py "My Fabric file"
[2]: http://www.saltycrane.com/blog/2010/09/class-based-fabric-scripts-metaprogramming-hack/ "Dynamic Functions with Fabric"
[3]: https://github.com/tjfontaine/linode-python "Linode API"
[4]: https://gist.github.com/830616/
