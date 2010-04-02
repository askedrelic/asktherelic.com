
<p id="credits">
Powered by <a href="http://www.blogofile.com">Blogofile</a>.<br/>
<br/>
RSS feeds for <a href="${bf.util.site_path_helper(bf.config.blog_path,'feed')}">Entries</a>
% if bf.config.disqus_enabled:
 and <a
href="http://${bf.config.disqus_name}.disqus.com/latest.rss">Comments</a>.
% endif
<br>
</p>
% if bf.config.disqus_enabled:
<script type="text/javascript">
//<![CDATA[
(function() {
		var links = document.getElementsByTagName('a');
		var query = '?';
		for(var i = 0; i < links.length; i++) {
			if(links[i].href.indexOf('#disqus_thread') >= 0) {
				query += 'url' + i + '=' + encodeURIComponent(links[i].href) + '&';
			}
		}
		document.write('<script charset="utf-8" type="text/javascript" src="http://disqus.com/forums/${bf.config.disqus_name}/get_num_replies.js' + query + '"></' + 'script>');
	})();
//]]>
</script>
% endif
