<%inherit file="site.mako" />
<%include file="post.mako" args="post=post" />
<div id="disqus_thread"></div>
<script type="text/javascript">
  var disqus_url = "${post.permalink}";
</script>
% if bf.config.disqus_enabled:
<script type="text/javascript" src="http://disqus.com/forums/${bf.config.disqus_name}/embed.js"></script>
<noscript><a href="http://${bf.config.disqus_name}.disqus.com/?url=ref">View the discussion thread.</a></noscript><a href="http://disqus.com" class="dsq-brlink">blog comments powered by <span class="logo-disqus">Disqus</span></a>
% endif
