#!/usr/bin/python

# .prolusion.py ---
#
# Author: Julien Wintz
# Created: Wed Feb 19 09:19:55 2014 (+0100)
# Version:
# Last-Updated:
#           By:
#     Update #: 25
#

# Change Log:
#
#

import re, os

def passwd(machine, login, port):
    s = "machine %s login %s port %s password ([^ ]*)\n" % (machine, login, port)
    p = re.compile(s)
    authinfo = os.popen("gpg2 -q --no-tty -d ~/.prolusion.gpg").read()
    return p.search(authinfo).group(1)
