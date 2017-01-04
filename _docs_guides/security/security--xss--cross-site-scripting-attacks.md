XSS
===

What it is
----------
*   There are 3 types...

### Type 1: stored XSS attacks
*   injected script is permanently stored on the target servers
    *   e.g. in a message forum post, comment field, etc.
*   victim retrieves & automatically runs the malicious script when it requests the stored info
    *   e.g. if an attacker posted a malicious script in an article comment, the script would be 
        automatically retrieved & run by anyone who visits the article's comments section (i.e. the
        containing page

### Type 2: reflected XSS attacks
*   injected script is reflected off the web server, such as in an error message, search result, or
    any other response that includes some or all of the input sent to the server as part of the
    request
*   When a user is tricked into clicking on a malicious link, submitting a specially crafted form,
    or even just browsing to a malicious site, the injected code travels to the vulnerable website,
    which reflects the attack back to the user’s browser.
    *   Victim's browser then executes the code because it came from a "trusted" server.

### Type 3: DOM-based XSS attacks
*   attack payload is executed as a result of modifying the DOM "environment" in the victim’s
    browser used by the original client side script, so that the client side code runs in an
    "unexpected" manner.
*   I.E. the page itself doesn't change, but the client side code contained in the page executes 
    differently due to the malicious modifications that have occurred in the DOM environment

*   [Full OWASP explanation](https://www.owasp.org/index.php/DOM_Based_XSS)


Prevention
----------
*   Preventing XSS attacks essentially entails proper escaping and encoding

*   [XSS Explained](http://www.securesolutions.no/xss-explained/)
*   [OWASP's XSS prevention cheatsheet](https://www.owasp.org/index.php/XSS_(Cross_Site_Scripting)_Prevention_Cheat_Sheet)


Tools
-----
*   [Browser Exploitation Framework (BeEF)](http://beefproject.com/)
    *   web browser-focused penetration testing tool, to ID vulnerable client-side attack vectors
        *   lets you easily identify potential XSS exploits
    *   Allows simulation of multiple browsers - thus allowing you to ID and prevent
        browser-specific vulnerabilities in your webapp
*   [Guide to understanding XSS – Payloads, attack vectors, BeEF hooking, MiTM with Shank and some history](http://www.securesolutions.no/xss-explained/)
    *   Outdated, but it directly includes BeEF examples
