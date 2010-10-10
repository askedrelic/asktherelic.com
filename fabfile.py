import re
import sys
from datetime import datetime

from fabric.api import *

def package():
    with cd("_site/"):
        local(("tar zcvf ../blog.tgz blog css projects p images about "
            "sitemap.xml "))

def new_post(post_name):
    NON_CHAR = re.compile(r'[^a-z0-9-]+')
    def prettify_title(title):
        title = title.lower()
        title = NON_CHAR.sub('-', title)
        return title

    date_format = "%Y/%m/%d %H:%M:%S"
    file_date_format = "%Y-%m-%d"
    now = datetime.now()

    fname = "_posts/%s-%s.markdown" % (now.strftime(file_date_format), prettify_title(post_name))

    new_file = open(fname, 'w')

    template = """---
    categories: Life
    date: %s
    tags: ''
    title: %s
    draft: true
    ---
    """ % (now.strftime(date_format), post_name)

    new_file.write(template)
    new_file.close()

    print "new post '%s' created" % fname

#def publish(post_name):
#    """
#    sed -e's/draft: true/draft: false'
#    """
#    from datetime import datetime
#
#    now = datetime.now()
#    old_post_date = "2000/01/01 00:00:01"
#    post_date = now.strftime('%Y/%m/%d %H:%M:%S')
#    post_format = "_posts/0000_%s.rst"
#    post = post_format % "_".join(post_name.split(" "))
#    local("sed -i -e's!%s!%s!' %s" % (old_post_date, post_date, post))

def install():
    local("sudo pip install -r requirements.txt")

def test():
    local("blogofile build")
    local("blogofile serve 9000")

#@hosts('h4941w83@morgangoose.com')
#def build():
#    local("blogofile build")
#    local(("python _extensions/sitemap_gen/sitemap_gen.py "
#        "--config=_extensions/sitemap_gen/config.xml"))
#
#    package()
#    put("blog.tgz", "var/www/html/")
#    with cd("var/www/html/"):
#        run("tar zxvf blog.tgz")
