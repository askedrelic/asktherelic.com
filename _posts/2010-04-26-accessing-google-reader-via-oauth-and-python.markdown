---
categories: Life
date: 2010/04/26 18:19:40
tags: ''
title: Accessing Google Reader via OAuth and Python
---
Last month, Google Reader [announced][1] support for accessing user data via OAuth. Previously, access was unofficially allowed using the [ClientLogin method][2], which required the user's login and password. OAuth seems to be the recommended access method for the future, due to security it provides for a user. I've finally had a chance to figure out OAuth using Python and how to get your Reader data, so I wanted to share my method.

For an example of the ClientLogin method in Python, take a look at my [libgreader library][3] on github. It automates the ClientLogin auth and tokens that you are required to have for any requests. I'm working to merge this code below into a more generic Google Reader library supporting both auth methods.

I've written my code using v1.1.3 of the [OAuth2 python library][4] to help wrangle OAuth. This was my first foray into OAuth and using the library certainly helped for figuring out all the required data and security that you need to have on every request. If you haven't used OAuth before, definitely check out [http://oauth.net/][6] and the [Google docs][7] for using their OAuth implementation. If you just want to experiment with the process not using Python, use [this interactive JS/AJAX app][5].

###The Code
First, let's setup some imports and definitions. You can also [view this source code][9] on Github.

	$$code(lang=python)
	import urlparse
	import oauth2 as oauth
	
	#Unsecured http for testing, should be https for production
	scope = "http://www.google.com/reader/api"
	#Alphabetical list of a user's subscriptions
	sub_url = "%s/0/subscription/list" % scope
	#JSON list of a user's unread feed items
	reading_url = '%s/0/stream/contents/user/-/state/com.google/reading-list' % scope
	
	#Google Auth urls
	request_token_url = "https://www.google.com/accounts/OAuthGetRequestToken?scope=%s" % scope
	authorize_url = 'https://www.google.com/accounts/OAuthAuthorizeToken'
	access_token_url = 'https://www.google.com/accounts/OAuthGetAccessToken'
	
	$$/code

Now, you have to setup a consumer key with Google, for the future domain your webapp will run at. The url to manage your domains is [https://www.google.com/accounts/ManageDomains][8]

	$$code(lang=python)
	oauth_key = "www.asktherelic.com"
	oauth_secret = "XXXXXXXXXXXXXXXX"
	
	consumer = oauth.Consumer(oauth_key, oauth_secret)
	client = oauth.Client(consumer)
	$$/code

From here, most of the code mirrors the example code from the OAuth2 library, using a 3-step process to verify and get your required tokens from Google. In step 2, you have to manually open the link and authorize your script with Google.

	$$code(lang=python)
	# Step 1: Get a request token. This is a temporary token that is used for 
	# having the user authorize an access token and to sign the request to obtain 
	# said access token.
	
	resp, content = client.request(request_token_url, "GET")
	request_token = dict(urlparse.parse_qsl(content))
	
	print "Request Token:"
	print "    - oauth_token        = %s" % request_token['oauth_token']
	print "    - oauth_token_secret = %s" % request_token['oauth_token_secret']
	print
	
	# Step 2: Redirect to the provider. Since this is a CLI script we do not
	# redirect. In a web application you would redirect the user to the URL
	# below.
	
	print "Go to the following link in your browser:"
	print "%s?oauth_token=%s" % (authorize_url, request_token['oauth_token'])
	print
	
	accepted = 'n'
	while accepted.lower() == 'n':
	    accepted = raw_input('Have you authorized me? (y/n) ')
	
	# Step 3: Once the consumer has redirected the user back to the oauth_callback
	# URL you can request the access token the user has approved. You use the
	# request token to sign this request. After this is done you throw away the
	# request token and use the access token returned. You should store this
	# access token somewhere safe, like a database, for future use.
	token = oauth.Token(request_token['oauth_token'], request_token['oauth_token_secret'])
	client = oauth.Client(consumer, token)
	
	resp, content = client.request(access_token_url, "POST")
	access_token = dict(urlparse.parse_qsl(content))
	
	print "Access Token:"
	print "    - oauth_token        = %s" % access_token['oauth_token']
	print "    - oauth_token_secret = %s" % access_token['oauth_token_secret']
	print
	print "You may now access protected resources using the access tokens above."
	$$/code

An annoying process, but once completed, you can create an authorized client which can hit any Google Reader url and access data. First, let's start off with the user's subscription list. Then the user's reading list.

	$$code(lang=python)
	#Authorized client using access tokens
	token = oauth.Token(access_token['oauth_token'], access_token['oauth_token_secret'])
	client = oauth.Client(consumer, token)
	
	#Get user's subscription list
	resp, content = client.request(sub_url, 'GET')
	print content
	print 
	
	#Get user's reading list
	resp, content = client.request(reading_url, 'GET')
	print content
	$$/code

In this CLI example, the user experience is pretty disjointed, but in a webapp setting, you would like for a more fluid experience. The way to do that is using a callback: a location that google will punt the user to after the 2nd step, when they have authorized your application. Checkout the code below for a simple example or the google docs for options.

	$$code(lang=python)
	#Google Auth using a callback
	callback = "http://www.asktherelic.com/thenextstep/"
	request_token_url = ("https://www.google.com/"
		"accounts/OAuthGetRequestToken?scope=%s&oauth_callback=%s" % (scope, callback))
	$$/code

###Possible Issues
The Google Reader API is still pretty undocumented, most knowledge comes from sniffing Google Reader traffic that their webapp generates or experimenting on your own. One difference between the ClientLogin and the OAuth login is that ClientLogin method requires your script to get a token from the Reader API. I haven't seen the OAuth method require that token in my testing, but it might be something that is still required.

Another thing I noticed while testing, with the 2nd OAuth auth step that occurs when you have multiple Google accounts, is that Google Apps accounts don't seem to work with my code. I'm using a regular gmail account but Google Apps appear to be a different affair.

Goodluck with the Reader API.

[1]: http://groups.google.com/group/fougrapi/browse_thread/thread/4430c9a6dea4d70f "Groups post on OAuth access"
[2]: http://code.google.com/apis/accounts/docs/AuthForInstalledApps.html "Authentication using ClientLogin"
[3]: http://github.com/askedrelic/libgreader "Python library for working with Google Reader"
[4]: http://github.com/simplegeo/python-oauth2/ "OAuth2 v1.1.3"
[5]: http://googlecodesamples.com/oauth_playground/ "Interactive OAuth using AJAX"
[6]: http://oauth.net/
[7]: http://code.google.com/apis/accounts/docs/OAuth.html "docs for Google OAuth for Webapps"
[8]: https://www.google.com/accounts/ManageDomains "Getting your OAuth key/secret"
[9]: http://gist.github.com/380090