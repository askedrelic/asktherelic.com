<%inherit file="base.mako" />
<!doctype html> 
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    ${self.head()}
    <link rel="stylesheet" type="text/css" href="/css/sausage.reset.css"> 
    <link rel="stylesheet" type="text/css" href="/css/sausage.css"> 

    <script type="text/javascript" src="/js/jquery-1.5.2.js"></script>
    <script type="text/javascript" src="/js/jquery.ui.widget-1.8.11.js"></script>
    <script type="text/javascript" src="/js/jquery.sausage-1.0.js"></script>

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
          ${next.body()}
        </div><!-- End Prose Block -->
      </div><!-- End Main Block -->
      <div id="footer">
        ${self.footer()}
      </div> <!-- End Footer -->
    </div> <!-- End Content -->
  </body>
</html>
<%def name="head()">
  <%include file="head.mako" />
</%def>
<%def name="header()">
  <%include file="header.mako" />
</%def>
<%def name="footer()">
  <hr/>
  <%include file="footer.mako" />
</%def>
