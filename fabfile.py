import re
import sys
from datetime import datetime

from fabric.api import *

def new(post_name):
    """new post. requires post name arguement"""
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
draft: false
---
    """ % (now.strftime(date_format), post_name)

    new_file.write(template)
    new_file.close()

    print "New draft post created: \n%s\n" % fname

def watch():
    """
    Watch for changes using when-change.py script and rebuild
    https://github.com/joh/when-changed
    """
    clean()
    build()
    local("""when-changed.py $(ls | egrep -v "_site|\*.pyc") -c "fab clean build" """)

def serve():
    local("blogofile serve 8000")

def test():
    local("blogofile build")

def clean():
    local("rm -r _site/")

def build():
    local("blogofile build")

def package():
    with lcd('_site/'):
        local("tar zcvf ../_blog.tgz --exclude '.DS_Store' --exclude '.gitignore' --exclude 'fabfile*' *")

@hosts('askedrelic@asktherelic.com')
def deploy():
    """push latest version of the site"""
    clean()
    build()
    package()
    put("_blog.tgz", "public_html/asktherelic.com/private/blog.tgz")
    with cd("public_html/asktherelic.com/private/"):
        run("tar -C ../public/ -xvzf blog.tgz")
