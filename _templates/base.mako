<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    ${self.head()}
  </head>
  <body>
    <script type="text/javascript">
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-1004202-1']);
    _gaq.push(['_trackPageview']);

    (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(ga);
    })();
    </script>
    <div id="content">
      ${self.header()}
      <div id="main_block">
        <div id="prose_block">
          ${self.body()}
        </div><!-- End Prose Block -->
        ${self.sidebar()}
      </div><!-- End Main Block -->
      <div id="footer">
        ${self.footer()}
      </div> <!-- End Footer -->
    </div> <!-- End Content -->
  </body>
</html>

<!-- These should be overridden in site.mako: -->
<%def name="head()">
</%def>
<%def name="header()">
</%def>
<%def name="footer()">
</%def>
<%def name="sidebar()">
</%def>
