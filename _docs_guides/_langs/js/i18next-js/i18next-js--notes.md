2 general approaches to i18n
============================
1)   For each page, compile language-specific versions, have the server return the appropriate
     version based on the currently set locale/language.
2)   Compile only 1 version of each page, containing locations where text can be inserted. Have
     the server return insertable text based on the currently set locale/language, then insert it

Resource resolution
===================

Lookup order for keys
---------------------
1)  language + region. e.g.:  en-US
2)  language only.     e.g.:  en
3)  fallback language
    *   specified in options.fallbackLng

Specifying resource locations
=============================


Lazy-loading languages
======================
*   don't add a resources object to the initialization hash if you're lazy loading your language data
    *   it will auto-load the specified resources if you do this


