echo "loaded search_scripts.sh!"

alias regexes="gnome-terminal --title=~REGEXES --geometry 110x50-0-0 -x vim ~/regexes_helpful.txt"

################################################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ SEARCH FILES ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
################################################################################

function lsrdeep {
    ls -R ./ 2>/dev/null | awk '
        /:$/&&f{
            s=$0;
            f=0
        }
        /:$/&&!f{
            sub(/:$/,"");
            s=$0;
            f=1;
            next
        }
        NF&&f{
            print s"/"$0 
        }
    ' | ack $1 2>/dev/null
}

################################################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ TEXT PROCESSING  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
################################################################################
# rm leading & trailing whitespace from output 
#(yes, technically chomp only refers to removing trailing, but 'slice' was taken) 
alias chomp="awk '{\$1=\$1}1'"  

function tp_appendtext {
    (cat $2 ; echo '$1') > .TEMP_1234561_123456_123456.txt; rm $2; mv .TEMP_1234561_123456_123456.txt $2
}

#conglomerates 2 separate variables into a single string 
function tp_glue_vars {
  $(echo ${1}${2})
}

#trim whitespace before terminal output & condense large spaces into small ones [TOADD]
function trim {
    awk '{$1=$1};1'
}

#=== FUNCTION ==========================================================
#        NAME:  tp_transpose
# DESCRIPTION:  turn table outputted to cli 90 degrees 
#               rows-->cols, cols-->rows 
#=======================================================================
function tp_transpose {
    awk '
    {
        for (i=1; i<=NF; i++)  {
            a[NR,i] = $i
        }
    }
    NF>p { p = NF }
    END {
        for(j=1; j<=p; j++) {
            str=a[1,j]
            for(i=2; i<=NR; i++){
                str=str" "a[i,j];
            }
            print str
        }
    }' $1
}
#=======================================================================



###############################################################################


################################################################################
#~~~~~~~~~~~~~~~~~~~~~~ TERMINAL COMMAND HISTORY SEARCHING ~~~~~~~~~~~~~~~~~~~~~
################################################################################

#=== FUNCTION ==========================================================
#        NAME:  searchhist
# DESCRIPTION:  search history for the given string.
#=======================================================================
function searchhist {
  history | grep "$1"
}
#=======================================================================

# display history as only a list of commands - no numbers etc.
alias history_cmds_only="history | awk '{\$1=\"\"; print \$0}' | awk '{\$1=\$1}1'"
#########################################################################

#count number of results a search returns
alias countf='find . | wc -l'

#=== FUNCTION ==========================================================
#        NAME:  searchfn
# DESCRIPTION:  Search that matches all files in current dir or its           
#               subdirs w/ the given text anywhere in their file name
#=======================================================================
function searchfn {
  if [ $# -eq 0 ]; then
    echo "Usage: searchfn [regex]"
    echo "  Matches only on file name & extension - path is excluded"
    echo "  [regex] - string or regular expression to match on" 
  else
    find . -regex ".*$1[^\/]*$" 2>/dev/null
  fi
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
         find . -name "*.$2" 2>/dev/null
         find . -name "*.$2" 2>/dev/null |wc -l
      fi
   #if only 1 param passed, 
   else
      find . -name "*\.$1*" 2>/dev/null
      find . -name "*\.$1*" 2>/dev/null |wc -l
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
