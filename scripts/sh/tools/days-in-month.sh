#!/usr/bin/env bash

#
# Utility for returning the number of days in the current month, the given month, or all months.
#
# Args:
#   --help        :: Show the help text
#   current       :: Show number of days in current month
#   [MONTH]       :: Month to display number of days in
#   all           :: Show full list of dates and months as key-value pairs (default if no arg given)
#
days_in_month() {
    location "days-in-month.sh"

    function __days_in_month_help__ {
        echo "NAME"
        echo "    days_in_month -- Return # of days in given (or current) month"
        echo ""
        echo "SYNOPSIS"
        echo "    days_in_month [MONTH]"
        echo ""
        echo "    [MONTH] inputs allowed: month # (e.g. 7), name (e.g. july), shorthand (e.g. jul)"
        echo      "       Also allows any casing (e.g. jul, Jul, JUL)"
        echo      "       If 'cur' or 'current' given, provides # of days in current month"
        echo "    If [MONTH] not given, show for all months (same if 'all' or 'list' given)"
        echo ""
        echo "EXAMPLES"
        echo "    days_in_month             -> (*shows each month paired with # of days in it)"
        echo ""
        echo "    days_in_month cur         -> \"August (current month) has 31 days\""
        echo "    days_in_month current     -> \"August (current month) has 31 days\""
        echo ""
        echo "    days_in_month 1           -> \"January has 31 days\""
        echo "    days_in_month november    -> \"November has 30 days\""
        echo "    days_in_month November    -> \"November has 30 days\""
        echo "    days_in_month SEP         -> \"September has 30 days\""
        echo "    days_in_month sept        -> \"September has 30 days\""
        echo ""
        return 1
    }

    # HANDLE HELP
    if [ "$1" = "help" ] || [ "$1" = "h" ] || [ "$1" = "-h" ] || [ "$1" = "--help" ] || [ "$1" = "-help" ]; then
        __days_in_month_help__
        return 1
    fi

    local HAD_CUR_ARG="FALSE"
    local MNTH=""

    #  If no arg given, set month to 'all'
    if [ ! -n "$1" ]; then
        MNTH="all"
    #  If 'cur' or 'current' given, set month to current date, and mark that cur was given as an arg (HAD_CUR_ARG)
    elif [ "$1" = "cur" ] || [ "$1" = "Cur" ] || [ "$1" = "CUR" ] || [ "$1" = "current" ] || [ "$1" = "CURRENT" ] || [ "$1" = "Current" ] || [ "$1" = "--cur" ] || [ "$1" = "--current" ] || [ "$1" = "now" ]; then
        HAD_CUR_ARG="TRUE"
        MNTH="$(date +%b)"
    #  If any other arg given, set the month to the argument given
    else
        MNTH="$1"
    fi

    ## HANDLE MONTH ARGUMENTS ##
    if [ "$MNTH" = "jan" ] || [ "$MNTH" = "january" ] || [ "$MNTH" = "Jan" ] || [ "$MNTH" = "January" ] || [ "$MNTH" = "JAN" ] || [ "$MNTH" = "JANUARY" ] || [ "$MNTH" = "1" ]; then
        if [ "$HAD_CUR_ARG" = "FALSE" ]; then
            echo "January has 31 days"
        else
            echo "January (current month) has 31 days"
        fi

    elif [ "$MNTH" = "feb" ] || [ "$MNTH" = "february" ] || [ "$MNTH" = "Feb" ] || [ "$MNTH" = "February" ] || [ "$MNTH" = "FEB" ] || [ "$MNTH" = "FEBRUARY" ] || [ "$MNTH" = "2" ]; then
        if [ "$HAD_CUR_ARG" = "FALSE" ]; then
            echo "February has 28 days"
        else
            echo "February (current month) has 28 days"
        fi

    elif [ "$MNTH" = "mar" ]  || [ "$MNTH" = "march" ]     || [ "$MNTH" = "Mar" ]  || [ "$MNTH" = "March" ]     || [ "$MNTH" = "MAR" ]  || [ "$MNTH" = "MARCH" ]     || [ "$MNTH" = "3" ]; then
        if [ "$HAD_CUR_ARG" = "FALSE" ]; then
            echo "March has 31 days"
        else
            echo "March (current month) has 31 days"
        fi

    elif [ "$MNTH" = "apr" ]  || [ "$MNTH" = "april" ]     || [ "$MNTH" = "Apr" ]  || [ "$MNTH" = "April" ]     || [ "$MNTH" = "APR" ]  || [ "$MNTH" = "APRIL" ]     || [ "$MNTH" = "4" ]; then
        if [ "$HAD_CUR_ARG" = "FALSE" ]; then
            echo "April has 30 days"
        else
            echo "April (current month) has 30 days"
        fi

    elif [ "$MNTH" = "may" ]  || [ "$MNTH" = "may" ]       || [ "$MNTH" = "May" ]  || [ "$MNTH" = "May" ]       || [ "$MNTH" = "MAY" ]  || [ "$MNTH" = "MAY" ]       || [ "$MNTH" = "5" ]; then
        if [ "$HAD_CUR_ARG" = "FALSE" ]; then
            echo "May has 31 days"
        else
            echo "May (current month) has 31 days"
        fi

    elif [ "$MNTH" = "jun" ]  || [ "$MNTH" = "june" ]      || [ "$MNTH" = "Jun" ]  || [ "$MNTH" = "June" ]      || [ "$MNTH" = "JUN" ]  || [ "$MNTH" = "JUNE" ]      || [ "$MNTH" = "6" ]; then
        if [ "$HAD_CUR_ARG" = "FALSE" ]; then
            echo "June has 30 days"
        else
            echo "June (current month) has 30 days"
        fi

    elif [ "$MNTH" = "jul" ]  || [ "$MNTH" = "july" ]      || [ "$MNTH" = "Jul" ]  || [ "$MNTH" = "July" ]      || [ "$MNTH" = "JUL" ]  || [ "$MNTH" = "JULY" ]      || [ "$MNTH" = "7" ]; then
        if [ "$HAD_CUR_ARG" = "FALSE" ]; then
            echo "July has 31 days"
        else
            echo "July (current month) has 31 days"
        fi

    elif [ "$MNTH" = "aug" ]  || [ "$MNTH" = "august" ]    || [ "$MNTH" = "Aug" ]  || [ "$MNTH" = "August" ]    || [ "$MNTH" = "AUG" ]  || [ "$MNTH" = "AUGUST" ]    || [ "$MNTH" = "8" ]; then
        if [ "$HAD_CUR_ARG" = "FALSE" ]; then
            echo "August has 31 days"
        else
            echo "August (current month) has 31 days"
        fi

    elif [ "$MNTH" = "sep" ] || [ "$MNTH" = "Sep" ] || [ "$MNTH" = "SEP" ] || [ "$MNTH" = "sept" ] || [ "$MNTH" = "september" ] || [ "$MNTH" = "Sept" ] || [ "$MNTH" = "September" ] || [ "$MNTH" = "SEPT" ] || [ "$MNTH" = "SEPTEMBER" ] || [ "$MNTH" = "9" ]; then
        if [ "$HAD_CUR_ARG" = "FALSE" ]; then
            echo "September has 30 days"
        else
            echo "September (current month) has 30 days"
        fi

    elif [ "$MNTH" = "oct" ]  || [ "$MNTH" = "october" ]   || [ "$MNTH" = "Oct" ]  || [ "$MNTH" = "October" ]   || [ "$MNTH" = "OCT" ]  || [ "$MNTH" = "OCTOBER" ]   || [ "$MNTH" = "10" ]; then
        if [ "$HAD_CUR_ARG" = "FALSE" ]; then
            echo "October has 31 days"
        else
            echo "October (current month) has 31 days"
        fi

    elif [ "$MNTH" = "nov" ]  || [ "$MNTH" = "november" ]  || [ "$MNTH" = "Nov" ]  || [ "$MNTH" = "November" ]  || [ "$MNTH" = "NOV" ]  || [ "$MNTH" = "NOVEMBER" ]  || [ "$MNTH" = "11" ]; then
        if [ "$HAD_CUR_ARG" = "FALSE" ]; then
            echo "November has 30 days"
        else
            echo "November (current month) has 30 days"
        fi

    elif [ "$MNTH" = "dec" ]  || [ "$MNTH" = "december" ]  || [ "$MNTH" = "Dec" ]  || [ "$MNTH" = "December" ]  || [ "$MNTH" = "DEC" ]  || [ "$MNTH" = "DECEMBER" ]  || [ "$MNTH" = "12" ]; then
        if [ "$HAD_CUR_ARG" = "FALSE" ]; then
            echo "December has 31 days"
        else
            echo "December (current month) has 31 days"
        fi

    ## Handle 'full list' mode (all, list, cal, --all, --list) ##
    elif [ "$MNTH" = "all" ]  || [ "$MNTH" = "--all" ]  || [ "$MNTH" = "cal" ]  || [ "$MNTH" = "calendar" ]  || [ "$MNTH" = "full-list" ]  || [ "$MNTH" = "list" ]  || [ "$MNTH" = "--list" ]; then
        echo "January:    31"
        echo "February:   28"
        echo "March:      31"
        echo "April:      30"
        echo "May:        31"
        echo "June:       30"
        echo "July:       31"
        echo "August:     31"
        echo "September:  30"
        echo "October:    31"
        echo "November:   30"
        echo "December:   31"

    ## Handle unknown inputs ##
    else
        __days_in_month_help__
        echo "ERROR: \"$1\" is an invalid argument"
        echo "    If argument given, must be one of:"
        echo "    *   A number from 1-12 e.g. 1, 5"
        echo "    *   A month shorthand e.g. sep, sept, Sep, Sept, SEP, SEPT"
        echo "    *   A month name e.g. may, May, MAY"
        echo "    *   \"all\" or \"list\", to show for all months at once"
        echo "    *   --help"
        echo ""
    fi
}


# Run automatically if script is being called directly.
# e.g. ./days-in-month.sh jan
if [ ! $_ != $0 ]; then
    function location {
        local NAME_OF_HOME_FILE=$1
    }
    days_in_month $@
else
    alias month_days="days_in_month"
    alias daysinmonth="days_in_month"
    alias monthdays="days_in_month"
    alias numdaysinmonth="days_in_month"
    alias num_days_in_month="days_in_month"
fi
