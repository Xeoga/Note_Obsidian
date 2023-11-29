#!/bin/bash
#
message=$(date "+%Y %m %d %H:%M")
git add *
git commit -m "$message"
git push
