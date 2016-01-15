echo "loaded search_scripts.sh!"

alias regexes="gnome-terminal --title=~REGEXES --geometry 110x50-0-0 -x vim ~/regexes_helpful.txt"

#count number of results a search returns
alias countf='find . | wc -l'

#=== FUNCTION ==========================================================
#        NAME:  searchfn
# DESCRIPTION:  Search that matches all files in current dir or its           
#               subdirs w/ the given text anywhere in their file name
#=======================================================================
function searchfn {
  find . -regex ".*$1[^\/]*$" 2>/dev/null
}
#=======================================================================

#=== FUNCTION ==========================================================
#        NAME:  searchhist
# DESCRIPTION:  search history for the given string.
#=======================================================================
function searchhist {
  history | grep "$1"
}
#=======================================================================

#=== FUNCTION ==========================================================
#        NAME:  findtype
# DESCRIPTION:  find all files w/ given extension that contain a pattern
#               To return an exact extension:   findtype -a pattern
#=======================================================================
function findtype {
   #if 2 parameters have been passed into this 
   if [ ! -z "$2" ]
   then
      if [ "$1" = "-a" ]
      then
         find . -name "*.$2"
         find . -name "*.$2"|wc -l
      fi
   else
      find . -name "*\.$1*"
      find . -name "*\.$1*"|wc -l
   fi
}
#=======================================================================

#=== FUNCTION ==========================================================
# NAME: grep_ex1_inc2           
# DESCRIPTION:  displays lines containing $2 that do not contain $1
#=======================================================================
function grepx1i2 {
    grep --colour=auto -v $1 --line-buffered | grep --colour=auto --line-buffered $2
}
#=======================================================================

#=== FUNCTION ==========================================================
#        NAME:  google
# DESCRIPTION:  Search google for given param e.g. 
#                   google "om nom nom"
#               To use literal strs in search, use single quotes on the
#               outside & double quotes inside: e.g. 
#                   google '"om nom nom"'
#               All regular google keywords work e.g. 
#                   google '"om nom" OR omnom"'
#
# PARAMETER 1:  the string you're searching, between quotes.
#=======================================================================
function google {
  firefox "http://www.google.com/search?q=$1"
}
#=======================================================================
