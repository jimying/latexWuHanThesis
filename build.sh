#!/bin/bash
# Build on linux
# Texlive 2009, http://thinfilm.ustc.edu.cn/~liangzi/software/CTeXlive/
# mount -o loop CTeXLive2008 090306.iso /opt/texlive
find ./ -name "*.aux" -o -name "*.out" -o -name "*.toc" -o -name "*.bak" -o -name "*.log" -o -name "*.lof" -o -name "*.lot" -o -name "*.bbl" -o -name "*.blg"|xargs rm -f 
rm *.pdf
#pdflatex template
#bibtex template
pdflatex template
gbk2uni template
pdflatex template
find ./ -name "*.aux" -o -name "*.out" -o -name "*.toc" -o -name "*.bak" -o -name "*.log" -o -name "*.lof" -o -name "*.lot"|xargs rm -f 
