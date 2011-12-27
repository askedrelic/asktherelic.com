<%inherit file="base.mako" />
<!doctype html> 
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="Content-Type" content="text/html" />
        ${self.head()}
        <script type="text/javascript" src="/js/jquery-1.5.2.js"></script>
        <script type="text/javascript" src="/js/jquery.ui.widget-1.8.11.js"></script>
        <script type="text/javascript">
        </script>
    </head>
    <body>
    <div id="container">
        <div id='container2'>
            <div id='container1'>
                <div id='left'>
                    ${self.header()}
                    <div id="content">
                        <div id="main_block">
                            <div id="prose_block">
                            ${next.body()}
                            </div><!-- End Prose Block -->
                        </div><!-- End Main Block -->
                        <div id="footer">
                            ${self.footer()}
                        </div> <!-- End Footer -->
                    </div> <!-- End Content -->
                </div>
                <div id='right'>
                    <div id="right-header">
                        <a href="/"><h1>Ask the Relic</h1></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
  </body>
</html>
<%def name="head()">
  <%include file="head.mako" />
</%def>
<%def name="header()">
  <%include file="header.mako" />
</%def>
<%def name="footer()">
  <div class="hr"></div>
  <%include file="footer.mako" />
</%def>
