#! /bin/bash

for f in host*;
do
	sed -i 's/ip /ip -6 /g' $f
	sed -i 's/4.8.8.20/ 1::FFFF:0408:0814 /g' $f
	sed -i 's/4.8.8.21/ 1::FFFF:0408:0815 /g' $f
	sed -i 's/4.8.8.30/ 1::FFFF:0408:081E /g' $f
	sed -i 's/4.8.8.31/ 1::FFFF:0408:081F /g' $f
	sed -i 's/4.8.8.40/ 1::FFFF:0408:0828 /g' $f
	sed -i 's/4.8.8.41/ 1::FFFF:0408:0829 /g' $f
	sed -i 's/4.8.8.50/ 1::FFFF:0408:0832 /g' $f
	sed -i 's/4.8.8.51/ 1::FFFF:0408:0833 /g' $f
done
