# !/bin/sh
for i in `ls *.tex`;
do
  latexmk -c $i 
done
rm -rf _minted* *.nav *.snm
