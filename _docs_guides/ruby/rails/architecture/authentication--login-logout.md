Three main login/logout behaviours
==================================

1.  forget users on browser close
2.  automatically remember users on revisiting site
3.  optionally remember users based on the value of a "remember me" checkbox

Sessions
--------
*   http: a stateless protocol that treats each request as an independent transaction.
		*   can't use info from past requests
		*   thus, there is no way to remember a user's identity from page to page via http
		*   instead, we use a session

*   session: semi-permanent connection between 2 computers
		*   e.g. client using a web browser & server running Rails

