#!/usr/bin/env bash
set -e # halt script on error

echo 'Testing travis...'
bundle exec jekyll build
#bundle exec htmlproof ./_site --verbose
qm=$(ipfs add -Q -w -r $WWW/web/michelc.tk/resumecard)
echo http://127.0.0.1:8080/ipfs/$qm/resumecard
odrive refresh $WWW/web/michelc.tk/resumecard
