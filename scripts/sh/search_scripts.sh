echo "* search scripts loading..."

alias regexes="gnome-terminal --title=~REGEXES --geometry 110x50-0-0 -x vim ~/regexes_helpful.txt"

################################################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ SEARCH FILES ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
################################################################################

# TODO repair lsrdeep - occasionally it puts 2 items on the same line
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
# namespace: txt_

# rm leading & trailing whitespace from output 
#(yes, technically chomp only refers to removing trailing, but 'slice' was taken) 
alias chomp="awk '{\$1=\$1}1'"  
alias txt_chomp="chomp"

function tp_appendtext {
    (cat $2 ; echo '$1') > .TEMP_1234561_123456_123456.txt; rm $2; mv .TEMP_1234561_123456_123456.txt $2
}
alias txt_tp_appendtext='tp_appendtext'

#conglomerates 2 separate variables into a single string 
function tp_glue_vars {
  $(echo ${1}${2})
}
alias txt_tp_glue_vars='tp_glue_vars'

#trim whitespace before terminal output & condense large spaces into small ones [TOADD]
function trim {
    awk '{$1=$1};1'
}
alias txt_trim="trim"

alias col1="awk '{print \$1}'"

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

# remove all occurrences of the given character from the stream passed in
function txt_rm_char {
    CHAR_TO_REMOVE = $1
    awk "{gsub(/$1/,\"\",\$0); print \$0}"
    unset CHAR_TO_REMOVE
}

# remove ALL double quotes from a string (stream passed in), from beginning to end
function txt_rm_double_quotes {
    awk '{gsub(/"/,"",$0); print $0}'
}


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

alias history_filtered='history | ack -v " lsa" | ack -v " ls" | ack -v "history" | ack -v "cat " | ack -v " cd " | ack -v "bashrc" | ack -v "( ruby)|( rake)" | ack -v "pwd" | ack -v "searchfn" | ack -v "rbash" | ack -v "bundler"'

alias inc1='ruby -e "puts STDIN.first.to_i + 1"'


################################################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ IN-CLI TODO LISTS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
################################################################################
MASTER_TODO_PATH="$SNIPPETS_DIR/todos/master_todo.md"
todo_new_item() {
    echo $SNIPPETS_DIR
    # TODO actual todo_new_item code
    #
    # STEPS:
    #    find line w/ todo heading, matching ~~~~~~~~~~_TODO_~~~~~~~~~~ 
    #    insert $1 after todo heading
    #    insert [{firstWordInTodo}_{secondWordInTodo}]
    #
    # OPTIONAL:
    #    add number of tasks total to line at top
    #        increment number of tasks on each run of todo_new_item
    #        insert "[{CUR_NUM_TASKS}]" at end of each new todo item
    #    add number of tasks to do to line at top
    #        increment number of tasks on each run of todo_new_item
    #        decrement number of tasks on each run of todo_item_complete 
    #    text alignment (at 4 spaces in) for all todo items
    #
    # OPTIONAL ADDITIONAL todo_* FEATURES:
    #    Replace total # (top line) on each run of a todo_* func
    #        - get # by counting /^[*!]/ matches
    #    Do the same for number remaining, by counting /^\*/g matches
    #    Something to handle setting date-based todos?
    #        ? creation of new files for dates, with TODOs moved over?
    #        ? manual selection of todos to move over to new file?
    #            ? selection via a # range?
    #        ? have master todo and separate date-based todos?
    #            ? commands to print each type of todo?
    #   Something to handle "topics"?
    #
    # ADDITIONAL todo_* FUNCTIONS:
    #    1. Mark todo item done.
    #       *   make task_tag var: $1 surrounded by [] (if it's not already)
    #       *   search for task_tag var, find matching line
    #       *   find line w/ "done" heading, matching ~~~~~~~~~~_DONE_~~~~~~~~~~
    #       *   move content of line w/ task_tag match, below line w/ "done" heading
    #       *   swap "*" at start of line with !
    #       *   add [DONE] tag to end of line
    #    2. Get # of todo items remaining
    #       *   Find line containing this #, and print it
    #
    # NOTE: Do this in JS/TS/Node, Kotlin, Ruby, or Python
    #
    # *** DO NOT WRITE THIS IN BASH!!! ***
}

todo_view_list() {
    cat "$MASTER_TODO_PATH"
}

# Convenience aliases for getting various numbers of items from end of lists
alias tail1="tail -n 1"
alias tail2="tail -n 2"
alias tail3="tail -n 3"
alias tail4="tail -n 4"
alias tail5="tail -n 5"


echo "* search scripts loaded!"

