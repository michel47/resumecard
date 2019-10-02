#

echo "--- # publishing hCard"
dist=../_site/hCard
cat vCard.vcf | qrencode -l L -s 5 -o QRcard.png;
z8=$(ipfs add -Q --hash sha1 -r $dist --cid-base=base58btc)
qm=$(ipfs add -Q -r $dist --cid-base=base58btc)
chart=https://chart.googleapis.com/chart?cht=qr&choe=UTF-8&chld=M&chs=210&chl=
echo " - $qm" >> qm.yml
echo qm: $qm
echo url: ${chart}http://0.0.0.0:8080/ipfs/$z8
echo url: ${chart}http://0.0.0.0:8080/ipfs/$qm
cat <<EOT | ed hCard.htm
/qm:/c
qm: $z8
.
wq
EOT
cat <<EOT | ed QRcode.htm
/qm:/c
qm: $qm
.
wq
EOT
qm=$(ipfs add -Q --hash sha1 -r $dist --cid-base=base58btc)
ipfs files rm -r /my/hcard 2>/dev/null
ipfs files cp /ipfs/$z8 /my/hcard
ipfs name publish --key=hCard /ipfs/$qm

