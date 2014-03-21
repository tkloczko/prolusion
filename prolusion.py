#!/usr/bin/python

# .prolusion.py ---
#
# Author: Julien Wintz
# Created: Wed Feb 19 09:19:55 2014 (+0100)
# Version:
# Last-Updated:
#           By:
#     Update #: 54
#

# Change Log:
#
#

import os

def passwd(entry):
    return os.popen("pass" + " " + entry).read()
