#!/usr/bin/env bash
set -e # halt script on error

echo 'Publishing on IPFS...'
bundle exec jekyll build
#bundle exec htmlproof ./_site --verbose
ipfs add -n -Q -r _site/ --cid-base=base58btc
qm=$(ipfs add -Q -w -r _site/ --cid-base=base58btc)
wrapid $qm resume$YY
echo http://127.0.0.1:8080/ipfs/$qm/resume$YY

# post resume on IPFS network ...
YY=$(date +%y)
if ipfs files stat /my/documents/application/ 1>/dev/null; then
 ipfs file rm /my/documents/application/resume$YY
else
 ipfs files mkdir -p /my/documents/application/
fi
ipfs files cp /ipfs/$qm  /my/documents/application/resume$YY
mt=$(mpublish /my/documents/application)
