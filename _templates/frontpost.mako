<%page args="post"/>
<div class="post frontpage">
  <span class="linkdate">${post.date.strftime("%d %b %Y")} »</span>
  <a href="${post.permapath()}" rel="bookmark" title="Permanent Link to ${post.title}">${post.title}</a>
</div>

