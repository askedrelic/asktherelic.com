import os, sys
from sh import mv
def confirm(prompt=None, resp=False):
    """prompts for yes or no response from the user. Returns True for yes and
    False for no.

    'resp' should be set to the default value assumed by the caller when
    user simply types ENTER.

    >>> confirm(prompt='Create Directory?', resp=True)
    Create Directory? [y]|n: 
    True
    >>> confirm(prompt='Create Directory?', resp=False)
    Create Directory? [n]|y: 
    False
    >>> confirm(prompt='Create Directory?', resp=False)
    Create Directory? [n]|y: y
    True

    """
    
    if prompt is None:
        prompt = 'Confirm'

    if resp:
        prompt = '%s [%s]|%s: ' % (prompt, 'y', 'n')
    else:
        prompt = '%s [%s]|%s: ' % (prompt, 'n', 'y')
        
    while True:
        ans = raw_input(prompt)
        if not ans:
            return resp
        if ans not in ['y', 'Y', 'n', 'N']:
            print 'please enter y or n.'
            continue
        if ans == 'y' or ans == 'Y':
            return True
        if ans == 'n' or ans == 'N':
            return False
print sys.argv[1]
with open(sys.argv[1]) as f:
    date, title, perma = None,None,None
    for line in f.readlines():
        if 'date:' in line:
            date = line[6:16].replace('/','-')
        if 'title:' in line:
            title = line[6:].strip().lower().replace(' ','-')
        if 'permalink:' in line:
            perma = line[10:].strip()

    print perma
    title = "{}-{}.markdown".format(date, title)
    print title

    if confirm(prompt='move?'):
        print mv(sys.argv[1], title)

