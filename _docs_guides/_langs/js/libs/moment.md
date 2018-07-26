---------------------------------------------------------------------------
---------------------------------------------------------------------------
MOMENT
======
---------------------------------------------------------------------------
---------------------------------------------------------------------------
If working in CI-WC:
    window['momentTest'] = __DEV__.lib.moment();

Reused variables (across examples):
    const moment = require('moment');
    const now = moment();

GET LOCALIZED DATE TERMS
========================
-   i.e. names of date values (such as months & weekdays) in current language

## Full locale data containing object:
    moment.localeData()

    // Can also get it on a created moment object:
    now.creationData().locale;

## Array of all month short forms in the current locale
    moment.localeData().monthsShort()

## Regex for searching a string for month short forms AND full month names of the current locale
    moment.localeData().monthsShortRegex();

-   Identical to:
        moment.localeData().monthsRegex();

## Array of all months (full) in the current locale
    moment.localeData().months();


DATE FORMATTING
===============
...including baked-in formats

## Standard date format
    moment.HTML5_FMT.DATE;
    // => "YYYY-MM-DD"

## Date + time format including ms
    moment.HTML5_FMT.DATETIME_LOCAL_MS
    // => "YYYY-MM-DDTHH:mm:ss.SSS"

## Output formatted date string
    now.format(moment.HTML5_FMT.MONTH);             // => "2018-07"
    now.format(moment.HTML5_FMT.DATE);              // => "2018-07-26"
    now.format(moment.HTML5_FMT.DATETIME_LOCAL);    // => "2018-07-26T02:41"
    now.format(moment.HTML5_FMT.DATETIME_LOCAL_MS); // => "2018-07-26T02:43:26.814"

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

OUTPUT STRINGS
==============
## Get date & time in human-readable "calendar" form
    now.calendar()

## Get date of month
    now.day()

## Get month of year
    now.month()

## Get year
    now.year()

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

STRING PARSING
==============
## Grab current month from a string, no matter the language

    const now = moment();
    const monthsRegex = now.creationData().locale.monthsShortRegex();
    '13 juillet 2019'.split(' ').find(pt => monthsRegex.test(pt));     // => juillet

