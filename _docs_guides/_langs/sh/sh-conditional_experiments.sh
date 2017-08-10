#!/usr/bin/env sh

alias current_directory="pwd | rev | cut -d'/' -f1 | rev"

conditionals_experiments() {
    echo ~
    
    echo "1ST ARG (\$1) VAL: |$1|"

    # Runs if variable is set and not a blank string (' ') or empty string ('')
    if [ ! -z "${1// }" ]; then echo "if_var_set_and_non_blank_string    *PASS*"
                           else echo "if_var_set_and_non_blank_string    fail";   fi

    # Runs if variable is set and not an EMPTY string ('').
    # Still runs for blank string (' ')
    if [ -n "$1" ]; then echo "if_var_set_and_non_empty_string    *PASS*"
                    else echo "if_var_set_and_non_empty_string    fail";   fi

    # Useless test - it always passes.
    if [ -n $1 ]; then
        echo "Param 1 test of [ -n \$1 ]          *PASS*"
    else
        echo "Param 1 test of [ -n \$1 ]          fail"
    fi

    if [ ! -z ${1} ]; then
        echo "Param 1 test of [ ! -z \${1}]       *PASS*"
    else
        echo "Param 1 test of [ ! -z \${1}]       fail"
    fi

    if [ ! -z "${1}" ]; then
        echo "Param 1 test of [ ! -z \"\${1}\"]     *PASS*"
    else
        echo "Param 1 test of [ ! -z \"\${1}\"]     fail"
    fi

    if [ ! -z ${1// } ]; then
        echo "Param 1 test of [ ! -z \${1// } ]   *PASS*"
    else
        echo "Param 1 test of [ ! -z \${1// } ]   fail"
    fi

    local OUTPUT_FILE=$([ ! -z "${1// }" ] && echo "$PWD/$1.sublime-project" || \
                                              echo "$PWD/$(current_directory).sublime-project")

    echo "OUTPUT_FILE:"
    echo $OUTPUT_FILE
}

echo ""
echo "*** Calling with no args ***"
conditionals_experiments

echo ""
echo "\n*** Calling with arg 'asdf' ***"
conditionals_experiments asdf

echo ""
echo "\n*** Calling with arg '' ***"
conditionals_experiments ''

echo ""
echo "\n*** Calling with arg ' ' ***"
conditionals_experiments ' '
