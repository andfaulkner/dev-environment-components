WIP

Man-in-the-middle attack
------------------------

Protocol downgrade attack
-------------------------
*   SSL-stripping man-in-the-middle attack
*   transparently converts a secure HTTPS connection into a plain HTTP connection
*   user can see that it's HTTP, but has no way of knowing that it should be HTTPS
    *   many sites don't use HTTPS, so it's reasonable to think nothing is wrong despite seeing HTTP

Implementing attack
*   sslstrip tool automates it

Prevention
*   Use HSTS header, which informs the browser that connections to the site should
    always use TLS/SSL
        *   HTTP response header field named "Strict-Transport-Security". 
    *   HOWEVER...this can be stripped by an attacker if it's a user's 1st visit
*   Built-in mechanism in all modern browsers (even IE!) to limit the problem:
    *   each browser includes a "pre-loaded" list of HSTS sites
        *   obviously this can't cover the entire internet
*   communicated by the server to the user agent via an

POODLE attack
-------------
*   Padding Oracle On Downgraded Legacy Encryption


