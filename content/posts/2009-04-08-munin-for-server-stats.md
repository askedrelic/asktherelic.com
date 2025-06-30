---
date: '2009-04-08T15:34:48Z'
slug: munin-for-server-stats
title: Munin For Server Stats
---


I switched servers recently, moving from a SliceHost VPS back to a spare machine
to try and save some money monthly. One of the final pieces of rebuilding the
server was to add a server status page. I tried at first with some php exec
calls and command one-liners, but that was pretty limited functionally and
required me to handle all the formatting. Then I found
[Munin](http://munin-monitoring.org/), a script-based monitoring tool that
uses RRDTool to create static graphs that you can view through your web server.

Several different monitoring tools popped up during my initial search, most
being for distributed networks, server farms, or being more dynamic involving
CGI scripts that run through Apache. I wasn't happy with those. Munin was
simple, creating static JPGs and HTML in a web visible directory. It works
having a server poll a set of scripts/plugins that you have running on a client
or "node" every 5 minutes. It records those values into a RRD database, then
updates the daily, weekly, monthly and yearly graphs. Plugins are Perl, Python,
or any other Bash style scripts. While it does have capabilities for
server-farms, you can run the server and node on the same server without
a problem. It's taken me only a few hours to setup and tweak things over the
last few days and I'm quite happy with it. While I'm not going to leave my
server stats visible to the public, you can [view example output
here](http://munin.ping.uio.no/).

After tweaking, the coolest things I have running right now are:

* Disk usage for my server

* SMART values and temperature for my HDD. SMART values are via the
  <em>smart_sda</em> plugin and temperatures are via the
  <em>hddtemp_smartctl</em> plugin. For the temp plugin, <a
  title="http://www.linuxweblog.com/blogs/sandip/20081224/munin-node-plugin-configurations"
  href="http://www.linuxweblog.com/blogs/sandip/20081224/munin-node-plugin-configurations"
  target="_blank">this guide</a> was pretty helpful for explaining the values to
  setup. I had to install <em>smartctl</em> and <em>hddtemp</em> as well for
  this plugin.

* Network traffic for the server via <a
  title="http://muninexchange.projects.linpro.no/?view&amp;phid=400"
  href="http://muninexchange.projects.linpro.no/?view&amp;phid=400">vnstat
  plugin</a> and utility. The default <em>if_</em> plugin that comes with the
  package seems pretty outdated, so <em>vnstat</em> kicks its ass.

* CPU usage, load, memory usage

* SSH failed logins/attempted breakins. The installed <em>auth</em> plugin was
  last updated in 2006, so I had to update a few of the grep string values and
  bash values to get it to work with Ubuntu. The main value printing section
  here:

        echo -n "illegal_user.value "
        echo $(grep "Failed password|Failed none" /var/log/auth.log | grep "`date '+%b %e'`" | wc -l)
        echo -n
        echo -n "possible_breakin.value "
        echo $(grep -i "POSSIBLE BREAK-IN ATTEMPT" /var/log/auth.log | grep "`date '+%b %e'`" | wc -l)
        echo -n "authentication_failure.value "
        echo $(grep "authentication failure" /var/log/auth.log | grep "`date '+%b %e'`" | wc -l)

* The grep search for "failed password" and "possible break-in" had changed,
  along with the date formatting in the auth.log file (no leading 0 in the date
  command).

As I found by fixing the <em>auth</em> plugin, it's very easy to write plugins. I will probably add my Nginx server requests eventually, but right now, this is enough. Its pretty fun to watch things change over time and review what I was doing on the server to cause a spike in resource usage or memory. It really helps you understand whats going on in the background of the server as well. The long-term value would be watching the yearly SMART graphs for a change in any values, possibly leading to a harddrive malfunction. Logs are great for tracking most things, but graphing really brings easy to read and immediate value.
