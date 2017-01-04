# JSON Web Tokens
-----------------------

Format
======
    aaaaaaaaaa.bbbbbbbbbbb.cccccccccccc

*   3 parts:
    1.  header
    2.  payload
    3.  signature

JWT anatomy part 1: header
--------------------------
Has 2 parts:
1.  type declaration, always typ: "JWT"
2.  hashing algorithm to use, e.g. alg: 'argon2'

Example

    {
      "typ": "JWT",
      "alg": "HS256"
    }

*   it must then be base64encoded

JWT anatomy part 2: payload
---------------------------
*   Free set of claims embedding whatever you want: username, email, roles, expiration date, etc.
    *   in other words, the actual data, in JSON format

Example

    payload = {
        "name": "John Doe",
        "admin": true
    },


JWT anatomy part 3: signature
-----------------------------
*   ensures data integrity
*   base64 representation created of the payload object,



btoa
====
*   stands for: Binary data TO base64-encoded Ascii
*   native to the browser, must use a module in node
