---
categories: Life
date: 2010/11/07 20:21:29
tags: ''
title: Scraping Comcast's Website and the 250GB Limit
---
It's bad enough that I cannot get FIOS at my apartment and am stuck with Comcast cable, but their website is a terrible mishmash of redirects and "preloading" pages, making it near unusable. My only reason for using their website is to verify my automatic billing is setup and that my bandwidth usage is below their 250GB cap. I decided to automate this and through feedback from other Comcast users, found some interesting results about their bandwidth caps.

Things I have learned about Comcast's bandwidth limits, through [two][shack1] [posts][shack2] on a forum I frequent:

* Not all users have a bandwidth limit or it is not available for them to view.
* For people with a 250GB limit, some people regularly break that limit and it appears to be enforced based on the saturation of the users's neighborhood.
* If you break the limit and they are enforcing it in your area, you are given a warning. You can get three total warnings before they shut off your service or take further action.

The script is quiet straight forward and uses the Python Mechanize library. If you have Python 2.6 (should work on 2.5 also), you can install mechanize with this command:

	$$code(lang=sh)
	easy_install mechanize
	$$/code

Then clone my git repo [https://github.com/askedrelic/comcast-bw](https://github.com/askedrelic/comcast-bw) or just download comcastBandwidth.py from there. You need to edit the top of the file to insert your username and password.

Here are the usage instructions:

	$$code(lang=sh)
	Usage: comcastBandwidth [-v[v]] [-w]
	
	Logging:
	    -v or -vv       Add more Vs for more verbosity!
	
	Warn Mode
	    -w --warn=NUM   Only output is usage above NUM GB (default is 200GB)
	$$/code

Default output would be something like below, assuming most people's usage is metered month to month, starting at the beginning of month... mine is atleast.

	$$code(lang=sh)
	You have used 134GB bandwidth in 7 days, with 23 days remaining in this month
	You can still download 169 linux CDs this month!
	$$/code

Finally, how I use the script is to have it run nightly in a cronjob with the -w flag, so that I only get a warning if I am over 200GB and want to watch my usage a bit more. Cronfile would look something like:

	$$code(lang=sh)
	0 0 * * * /comcast-bw/comcastBandwidth.py -w
	$$/code

If anything looks broken, try the -v flags and see if can narrow down the problem. Reply here if you need more help.

[shack1]: http://www.shacknews.com/laryn.x?id=24449551
[shack2]: http://www.shacknews.com/laryn.x?id=24341337