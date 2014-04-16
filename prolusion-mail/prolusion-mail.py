#!/usr/bin/python

import os

def passwd(entry):
    return os.popen("pass" + " " + entry).read()
