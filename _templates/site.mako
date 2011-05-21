<%inherit file="base.mako" />
<!doctype html> 
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    ${self.head()}
    <link rel="stylesheet" type="text/css" href="http://christophercliff.github.com/sausage/lib/sausage.reset.css"> 
<style type="text/css">
.sausage-set {
    position: fixed; right: 0; top: 0;
    width: 15px; height: 100%;
    border-left: solid 2px #fff;
    border-right: solid 2px #fff;
    background-color: #fff;
}
    .sausage {
        position: absolute; left: 0;
        width: 100%; height: 100%;
        background-color: #f1f1f1;
        text-decoration: none;
        -moz-border-radius: 8px;
        -webkit-border-bottom-left-radius: 8px;
        -webkit-border-top-left-radius: 8px;
        -webkit-border-bottom-right-radius: 8px;
        -webkit-border-top-right-radius: 8px;
        -moz-box-shadow: inset 0px 1px 2px 4px rgba(0, 0, 0, 0.025);
        -webkit-box-shadow: inset 0px 1px 2px 4px rgba(0, 0, 0, 0.025);
        cursor: pointer;
    }
    .sausage-hover,
    .sausage-current {
        background-color: #f2e4ed;
        -moz-box-shadow: inset 0px 1px 2px 4px rgba(51, 63, 70, 0.025);
    }
        .sausage-span {
            position: absolute; right: 24px; top: 5px; z-index: 2;
            display: none;
            width: 100px;
            padding: 2px 3px;
            color: #000;
            background-color: #fff;
            border: solid 2px #990066;
            font-size: 10px; line-height: 12px; font-weight: bold; text-align: center;
            -moz-border-radius: 7px;
            -webkit-border-bottom-left-radius: 7px;
            -webkit-border-top-left-radius: 7px;
            -webkit-border-bottom-right-radius: 7px;
            -webkit-border-top-right-radius: 7px;
            -moz-box-shadow: 1px 1px 1px 1px rgba(0, 0, 0, 0.05);
            -webkit-box-shadow: 1px 1px 1px 1px rgba(0, 0, 0, 0.05);
        }
        .sausage-hover .sausage-span,
        .sausage-current .sausage-span {
            display: block;
        }
</style>

        <script type="text/javascript" src="https://www.google.com/jsapi?key=ABQIAAAAa8C1i1BCf4iSC9UScC2DGBT2yXp_ZAY8_ufC3CFXhHIE1NvwkxTioD6mo3RDJ-ntkwLBh9NIgd1e4Q"></script>
        <script type="text/javascript">
            google.load("jquery", "1.5.1");
            google.load("jqueryui", "1.8.11");
    function OnLoad() {
    }
    google.setOnLoadCallback(OnLoad);
        </script>
        <script type="text/javascript" src="http://christophercliff.github.com/sausage/jquery.sausage.js"></script>
        <script type="text/javascript">
        </script>
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
