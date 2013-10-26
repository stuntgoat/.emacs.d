#!/bin/bash


/Library/Frameworks/Python.framework/Versions/2.7/bin/pyflakes $1
/Library/Frameworks/Python.framework/Versions/2.7/bin/pep8 --config=/Users/isaac/.emacs.d/bash/pep8 --repeat $1
