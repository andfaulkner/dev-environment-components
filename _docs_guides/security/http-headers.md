---------------
# HTTP Headings
---------------

*   [HTTP Headers from Dummies](https://code.tutsplus.com/tutorials/http-headers-for-dummies--net-8039)
    *   Nice summary of the basics

------------------------------------------------------------------------------------------------
Request headings
================

Accept-Language [REQUEST]
-------------------------
*   advertises client's language & preferred locale variant
*   server can use this to select which locale-specific content variant to use
    *   e.g. selecting whether to serve the English or French version of a page

*   mostly set transparently by browser based on e.g. country user is accessing the web through,
    language set in browser preferences, etc.

*   Use ONLY to select a default language/locale. It should be overrideable by an explicit option
    such as a value in a query parameter.
    *   in other words, only use this when the server has no other means to determine a user's
        preferred language / locale (such as on a user's first visit to your site)

*   Corresponding Response header: Content-language (describes language server used in the response)

*   [ExpressJS middleware module for parsing/handling accept-language](https://www.npmjs.com/package/express-request-language)


Authorization [REQUEST]
-----------------------
*   TODO:   More info required on Authorization request header


Cookie [REQUEST]
----------------
*   TODO:   More info required on Cookie request header

*   Example:

        Authorization: Basic bXl1c2VyOm15cGFzcw==


Referer [REQUEST]
-----------------
*   modern browsers set the "Referer" header on most requests, to list the URL of the page that
    triggered the request.
    *   E.g. if a request is triggered by a link, the "Referer" header on the request will be set
        to the URL of the page that contained the link

*   Example:

        Referer: http://home.example.com/

*   don't bother messing around with this - the usability cost of improving security here is huge,
    and the benefits are fairly minor.
    *   If you change the Referer policy (can be done easily with Helmet JS) to be very strict,
        it will prevent pages from being linked to or bookmarked, and will also block users behind
        certain firewalls

*   tl;dr: leave Referer alone.

*   [StackExchange answer clearly explaining Referer security](http://security.stackexchange.com/questions/7944/does-the-practice-of-blocking-an-off-site-referer-http-requests-improve-websi/7984#answer-7984)


------------------------------------------------------------------------------------------------
Response headings
=================

Content-language [RESPONSE]
---------------------------
*   Corresponding Request header: Accept-language (advertises client's default language / locale)
*   describes / identifies the language used in the response

Examples:
    
    Content-Language: en-CA
    Content-Language: en-US
    Content-Language: de-DE, en-CA


Public-Key-Pins [RESPONSE]
--------------------------
*   TODO: Gather more info on this, figure out how to use it effectively.
    Higher-security apps will require this, but it's not a HelmetJS default.

*   Example that pins 2 public keys for 60 days:
        
        Public-Key-Pins: pin-sha256="cUPcTAZWKaASuYWhhneDttWpY3oBAkE3h2+soZS7sWs="; pin-sha256="M8HztCzM3elUxkcjR2S5P4hhyBNf6lHkmjAHKhpGPWE="; max-age=5184000

*   [HelmetJS: HTTP Public Key Pinning](https://helmetjs.github.io/docs/hpkp/)
*   [Explanation of SSL/TLS](https://security.stackexchange.com/questions/20803/how-does-ssl-tls-work#answer-20833)
    *   Understanding this is essential to understand the concept of HTTP public key pinning


Vary [RESPONSE]
---------------
*   describes what parts of a request message (aside from the method, Host header field, and
    request target) might influence the origin server's process for selecting and representing the 
    response.

*   usage: mainly for determining whether or not a cached response is usable.
    *   When the header fields identified in the vary header contain matching values in both
        the new request and the stored response, then the stored response can be used to
        satisfy the request (thus avoiding the server round trip)

*   Example in server response header:

        Vary: accept-encoding, accept-language

*   indicates the server used the Accept-Encoding and Accept-Language fields (or lack thereof) in
    the request when determining what content to repond with.

*   WIP: get more info on "Vary" header - it's powerful and complicated

*   [Caching is hard, draw me a picture](http://www.bizcoder.com/caching-is-hard-draw-me-a-picture)
    *   covers the role Vary plays in HTTP caching
*   [Best Practices for Using the Vary Header](https://www.fastly.com/blog/best-practices-for-using-the-vary-header)
