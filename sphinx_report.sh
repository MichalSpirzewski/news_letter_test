#!/bin/bash

rm -rf report/latex
rm -rf report/doctrees

make latexpdf

cp report/ncbj_format/* report/latex/
sed -i "s/sphinxmaketitle/input{title.tex}/" report/latex/[!title]*.tex
sed -i "s/pagestyle{normal}/pagestyle{plain}/g" report/latex/[!title]*.tex
python3 report/ncbj_format/autofill.py report/conf.py report/latex/title.tex
cd report/latex/

sed -i "s/\\\begin{quote}//g" [!title]*.tex
sed -i "s/\\\end{quote}//g" [!title]*.tex

pdflatex [!title]*.tex
pdflatex [!title]*.tex
cd ../..
cp report/latex/htgr*.pdf .
