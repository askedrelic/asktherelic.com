import re
import sys
from datetime import datetime

from fabric.api import *

def clean():
    local("rm -r build/ || true")

def package():
    with lcd('build/'):
        local("tar zcvf ../blog.tgz --exclude '.DS_Store' *")

@hosts('askedrelic@asktherelic.com')
def deploy():
    """push latest version of the site"""
    clean()
    local('middleman build')
    package()
    put("blog.tgz", "public_html/asktherelic.com/private/blog.tgz")
    with cd("public_html/asktherelic.com/private/"):
        run("tar -C ../public/ -xvzf blog.tgz")
