#!/usr/bin/env bash
set -e # halt script on error
YY=$(date +%y)

echo 'Publishing on IPFS...'
bundle exec jekyll build
#bundle exec htmlproof ./_site --verbose
ipfs add -n -Q -r _site/ --cid-base=base58btc
qm=$(ipfs add -Q -r _site/ -cid-version=0)
qmemptyd=$(ipfs object new unixfs-dir)
wrap=$(ipfs object patch add-link $qmemptyd resume$YY $qm)
#wrapid $qm resume$YY
echo http://127.0.0.1:8080/ipfs/$wrap/resume$YY
echo $wrap | base36 -d
# post resume on IPFS network ...
if ipfs files stat /my/documents/application/ 1>/dev/null; then
 ipfs files rm -r /my/documents/application/resume$YY
else
 ipfs files mkdir -p /my/documents/application/
fi
ipfs files cp /ipfs/$qm  /my/documents/application/resume$YY
#mt=$(mpublish /my/documents/application)
