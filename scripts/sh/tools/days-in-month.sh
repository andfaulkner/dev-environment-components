#!/usr/bin/env bash

#
# Utility for returning the number of days in the current month, or the given month
#
# Args:
#   --help      :: Show the help text
#   [MONTH]     :: Month to display number of days in
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
        echo "    If [MONTH] not given, provides number of days in current month"
        echo ""
        echo "EXAMPLES"
        echo "    days_in_month             -> \"The current month (August) contains 31 days\""
        echo "    days_in_month 1           -> \"January contains 31 days\""
        echo "    days_in_month november    -> \"November contains 30 days\""
        echo "    days_in_month November    -> \"November contains 30 days\""
        echo "    days_in_month SEP         -> \"September contains 30 days\""
        echo "    days_in_month sept        -> \"September contains 30 days\""
        echo ""
        return 1
    }

    # HANDLE HELP
    if [ "$1" = "help" ] || [ "$1" = "h" ] || [ "$1" = "-h" ] || [ "$1" = "--help" ] || [ "$1" = "-help" ]; then
        __days_in_month_help__
        return 1
    fi

    local HAD_ARG=""
    local CUR_MNTH=""

    if [ ! -n "$1" ]; then
        HAD_ARG="FALSE"
        CUR_MNTH="$(date +%b)"
    else
        HAD_ARG="TRUE"
        CUR_MNTH="$1"
    fi

    if [ "$CUR_MNTH" = "jan" ] || [ "$CUR_MNTH" = "january" ] || [ "$CUR_MNTH" = "Jan" ] || [ "$CUR_MNTH" = "January" ] || [ "$CUR_MNTH" = "JAN" ] || [ "$CUR_MNTH" = "JANUARY" ] || [ "$CUR_MNTH" = "1" ]; then
        if [ "$HAD_ARG" = "TRUE" ]; then
            echo "January contains 31 days"
        else
            echo "The current month (January) contains 31 days"
        fi

    elif [ "$CUR_MNTH" = "feb" ] || [ "$CUR_MNTH" = "february" ] || [ "$CUR_MNTH" = "Feb" ] || [ "$CUR_MNTH" = "February" ] || [ "$CUR_MNTH" = "FEB" ] || [ "$CUR_MNTH" = "FEBRUARY" ] || [ "$CUR_MNTH" = "2" ]; then
        if [ "$HAD_ARG" = "TRUE" ]; then
            echo "February contains 28 days"
        else
            echo "The current month (February) contains 28 days"
        fi

    elif [ "$CUR_MNTH" = "mar" ]  || [ "$CUR_MNTH" = "march" ]     || [ "$CUR_MNTH" = "Mar" ]  || [ "$CUR_MNTH" = "March" ]     || [ "$CUR_MNTH" = "MAR" ]  || [ "$CUR_MNTH" = "MARCH" ]     || [ "$CUR_MNTH" = "3" ]; then
        if [ "$HAD_ARG" = "TRUE" ]; then
            echo "March contains 31 days"
        else
            echo "The current month (March) contains 31 days"
        fi

    elif [ "$CUR_MNTH" = "apr" ]  || [ "$CUR_MNTH" = "april" ]     || [ "$CUR_MNTH" = "Apr" ]  || [ "$CUR_MNTH" = "April" ]     || [ "$CUR_MNTH" = "APR" ]  || [ "$CUR_MNTH" = "APRIL" ]     || [ "$CUR_MNTH" = "4" ]; then
        if [ "$HAD_ARG" = "TRUE" ]; then
            echo "April contains 30 days"
        else
            echo "The current month (April) contains 30 days"
        fi

    elif [ "$CUR_MNTH" = "may" ]  || [ "$CUR_MNTH" = "may" ]       || [ "$CUR_MNTH" = "May" ]  || [ "$CUR_MNTH" = "May" ]       || [ "$CUR_MNTH" = "MAY" ]  || [ "$CUR_MNTH" = "MAY" ]       || [ "$CUR_MNTH" = "5" ]; then
        if [ "$HAD_ARG" = "TRUE" ]; then
            echo "May contains 31 days"
        else
            echo "The current month (May) contains 31 days"
        fi

    elif [ "$CUR_MNTH" = "jun" ]  || [ "$CUR_MNTH" = "june" ]      || [ "$CUR_MNTH" = "Jun" ]  || [ "$CUR_MNTH" = "June" ]      || [ "$CUR_MNTH" = "JUN" ]  || [ "$CUR_MNTH" = "JUNE" ]      || [ "$CUR_MNTH" = "6" ]; then
        if [ "$HAD_ARG" = "TRUE" ]; then
            echo "June contains 30 days"
        else
            echo "The current month (June) contains 30 days"
        fi

    elif [ "$CUR_MNTH" = "jul" ]  || [ "$CUR_MNTH" = "july" ]      || [ "$CUR_MNTH" = "Jul" ]  || [ "$CUR_MNTH" = "July" ]      || [ "$CUR_MNTH" = "JUL" ]  || [ "$CUR_MNTH" = "JULY" ]      || [ "$CUR_MNTH" = "7" ]; then
        if [ "$HAD_ARG" = "TRUE" ]; then
            echo "July contains 31 days"
        else
            echo "The current month (July) contains 31 days"
        fi

    elif [ "$CUR_MNTH" = "aug" ]  || [ "$CUR_MNTH" = "august" ]    || [ "$CUR_MNTH" = "Aug" ]  || [ "$CUR_MNTH" = "August" ]    || [ "$CUR_MNTH" = "AUG" ]  || [ "$CUR_MNTH" = "AUGUST" ]    || [ "$CUR_MNTH" = "8" ]; then
        if [ "$HAD_ARG" = "TRUE" ]; then
            echo "August contains 31 days"
        else
            echo "The current month (August) contains 31 days"
        fi

    elif [ "$CUR_MNTH" = "sep" ] || [ "$CUR_MNTH" = "Sep" ] || [ "$CUR_MNTH" = "SEP" ] || [ "$CUR_MNTH" = "sept" ] || [ "$CUR_MNTH" = "september" ] || [ "$CUR_MNTH" = "Sept" ] || [ "$CUR_MNTH" = "September" ] || [ "$CUR_MNTH" = "SEPT" ] || [ "$CUR_MNTH" = "SEPTEMBER" ] || [ "$CUR_MNTH" = "9" ]; then
        if [ "$HAD_ARG" = "TRUE" ]; then
            echo "September contains 30 days"
        else
            echo "The current month (September) contains 30 days"
        fi

    elif [ "$CUR_MNTH" = "oct" ]  || [ "$CUR_MNTH" = "october" ]   || [ "$CUR_MNTH" = "Oct" ]  || [ "$CUR_MNTH" = "October" ]   || [ "$CUR_MNTH" = "OCT" ]  || [ "$CUR_MNTH" = "OCTOBER" ]   || [ "$CUR_MNTH" = "10" ]; then
        if [ "$HAD_ARG" = "TRUE" ]; then
            echo "October contains 31 days"
        else
            echo "The current month (October) contains 31 days"
        fi

    elif [ "$CUR_MNTH" = "nov" ]  || [ "$CUR_MNTH" = "november" ]  || [ "$CUR_MNTH" = "Nov" ]  || [ "$CUR_MNTH" = "November" ]  || [ "$CUR_MNTH" = "NOV" ]  || [ "$CUR_MNTH" = "NOVEMBER" ]  || [ "$CUR_MNTH" = "11" ]; then
        if [ "$HAD_ARG" = "TRUE" ]; then
            echo "November contains 30 days"
        else
            echo "The current month (November) contains 30 days"
        fi

    elif [ "$CUR_MNTH" = "dec" ]  || [ "$CUR_MNTH" = "december" ]  || [ "$CUR_MNTH" = "Dec" ]  || [ "$CUR_MNTH" = "December" ]  || [ "$CUR_MNTH" = "DEC" ]  || [ "$CUR_MNTH" = "DECEMBER" ]  || [ "$CUR_MNTH" = "12" ]; then
        if [ "$HAD_ARG" = "TRUE" ]; then
            echo "December contains 31 days"
        else
            echo "The current month (December) contains 31 days"
        fi
    else
        __days_in_month_help__
        echo "ERROR: \"$1\" is an invalid argument"
        echo "    If argument given, must be one of:"
        echo "    *   A number from 1-12 e.g. 1, 5"
        echo "    *   A month shorthand e.g. sep, sept, Sep, Sept, SEP, SEPT"
        echo "    *   A month name e.g. may, May, MAY"
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
