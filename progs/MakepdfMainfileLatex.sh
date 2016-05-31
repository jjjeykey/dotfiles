#! /bin/bash
#
# December 2011
#
# Purpose:  compile latex->dvips->ps2pdf
#       either silently or verbosely
#
# Options:  noshow
#
# examples: MakepdfMainfile.sh myfile.tex noshow    # silent mode
#       MakepdfMainfile.sh myfile.tex       # verbose mode

# argument check
ERROR="Too few arguments : no file name specified"
[[ $# -eq 0 ]] && echo $ERROR && exit  # no args? ... print error and exit

# assume VERBOSE mode by default
noshow=0
[[ $# -eq 2 ]] && [[ $2 == "noshow" ]] && noshow=1  # otherwise turn on SILENT
mode

# name of MAINFILE
mainFile=$1

# incase we're compiling from within the CHAPTER file
set `grep -F %*** $1 | tr -d "%*" `""
dummy=$1

# delete the file extension
mainFile=${mainFile/%.tex/}
dummy=${dummy/\.*/}

# check the length of the dummy string, if it's 0 then latex the current file
# otherwise latex the referenced latex file
if [ $dummy ]
then
  mainFile=$dummy
fi

echo "======================================="
echo "Making PDF : Main file is $mainFile"
echo "======================================="
if [ $noshow -eq 1 ]
then
  echo "SILENT mode on"
  nohup makepdf.sh $mainFile 1 &
else
  echo "VERBOSE mode on"
  makepdf.sh $mainFile 1
  echo "======================================="
  echo "Made PDF : Main file is $mainFile".tex
  echo "======================================="
  egrep 'undefined' $mainFile.log
  egrep 'multiply-defined' $mainFile.log
  egrep '\\end occurred when \\iftrue'
  $mainFile.log
fi
