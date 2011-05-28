<%inherit file="site.mako" />

<script type="text/javascript">
    $(function() {
        $(window).sausage({
            page: '.post',
            content: function (i, $page) {
                return '<span class="sausage-span">' + $page.find('h2').first().text() + '</span>';
            }
        });
    });
</script>

% for post in posts:
  <%include file="post.mako" args="post=post" />
% if bf.config.blog.disqus.enabled:
  <div class="after_post"><a href="${post.permalink}#disqus_thread">Read and Post Comments</a></div>
% endif
  <hr class="interblog" />
% endfor
% if prev_link:
 <a href="${prev_link}">« Previous Page</a>
% endif
% if prev_link and next_link:
  --  
% endif
% if next_link:
 <a href="${next_link}">Next Page »</a>
% endif
