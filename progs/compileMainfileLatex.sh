#! /bin/bash
#
# compileMainfile.sh
#
#   December 2011
#
#   Purpose: compile a .tex file either using latex, pdflatex, or
#               latex=> dvips=> ps2pdf, in silent mode or verbose mode
#   examples
#           compileMainfile myfile.tex          # just latex myfile
#           compileMainfile -d myfile.tex       # latex => dvips => ps2pdf
#           compileMainfile -p myfile.tex       # pdflatex myfile
#
#           add the -q flag for SILENT (or quiet) mode
#           compileMainfile -q myfile.tex
#           compileMainfile -qd myfile.tex
#           compileMainfile -qp myfile.tex
#
# See pgs 249 & 250 of BASH COOKBOOK for examples of getopts- really useful!


# argument check
ERROR="Too few arguments : no file name specified"
[[ $# -eq 0 ]] && echo $ERROR && exit  # no args? ... print error and exit

# define functions
function makepdf ()
{
    echo "======================================="
    echo "Main file is $mainFile.tex"
    echo "======================================="
    if [ $quiet -eq 0 ]
    then
        echo "VERBOSE mode on"
        # latex mainFile.tex
        [[ $uselatex -eq 1 ]] && [[ $convertdvips -ne 1 ]] && latex $mainFile
        # latex => dvips => ps2pdf mainFile.tex
        [[ $convertdvips -eq 1 ]] && makepdf.sh $mainFile 1 && echo "DVIPS"
        # pdflatex
        [[ $usepdflatex -eq 1 ]] && pdflatex $mainFile && echo "PDFLATEX"
        egrep 'undefined' $mainFile.log
        egrep 'multiply-defined' $mainFile.log
        egrep '\\end occurred when \\iftrue' $mainFile.log
    else
        echo "SILENT mode on"
        if [ $convertdvips -eq 1 ]
        then
            # latex => dvips => ps2pdf mainFile.tex
            echo "DVIPS"
            nohup makepdf.sh $mainFile 1 &
        elif [ $uselatex -eq 1  ]
        then
            # latex mainFile.tex
            echo "just LaTeX"
            nohup latex $mainFile &
        elif [ $usepdflatex -eq 1 ]
        then
            # pdflatex
            echo "PDFlatex"
            nohup pdflatex $mainFile &
        fi
    fi
}


# set default values of flags
quiet=0
uselatex=1
usepdflatex=0
convertdvips=0

# check flags, and change defaults appropriately
while getopts 'abpqd' OPTION
do
 case $OPTION in 
  q)    quiet=1
   echo "Silent mode ON"
   ;;
  p)    usepdflatex=1
        uselatex=0
   ;;
  d)    convertdvips=1
   ;;
  ?)    printf "Usage: %s: [-a] [-b value] args\n" $(basename $0) >&2
        exit 2
        ;;
 esac 
done

shift $(($OPTIND - 1))

# check we haven't called with -dp 
# which would mean dvips and pdflatex
[[ $usepdflatex -eq 1 ]] && [[ $convertdvips -eq 1 ]] && echo "Option clash: cannot be called with -dp" && exit

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

# call the makepdf function
makepdf
exit
