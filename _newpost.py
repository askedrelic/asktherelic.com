 #!/usr/bin/env python
import re
import sys
from datetime import datetime
 
title = sys.argv[1]
 
NON_CHAR = re.compile(r'[^a-z0-9-]+')
def prettify_title(title):
    title = title.lower()
    title = NON_CHAR.sub('-', title)
    return title
 
date_format = "%Y/%m/%d %H:%M:%S"
file_date_format = "%Y-%m-%d"
now = datetime.now()
 
fname = "_posts/%s-%s.markdown" % (now.strftime(file_date_format), prettify_title(title))
 
new_file = open(fname, 'w')
 
template = """---
categories: Life
date: %s
tags: ''
title: %s
---
""" % (now.strftime(date_format), title)
 
new_file.write(template)
new_file.close()
 
print "new post '%s' created" % fname 
