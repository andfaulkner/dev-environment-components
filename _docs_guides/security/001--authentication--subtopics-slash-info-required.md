Authentication - topics
=======================

*   data obscuring
    *   hashing
        *   algorithms
        *   salting and random salting
        *   peppers
    *   secrets
    *   public-key encryption
    *   database "locking"

*   database storage
    *   database creation
    *   database configuration
    *   account and permanent user data storage
    *   session storage (i.e. is it currently active?)

*   route permissions
    *   ACLs
        *   [acl](https://www.npmjs.com/package/acl)
        *   [express-access-control](https://www.npmjs.com/package/express-access-control)
        *   [express-acl](https://www.npmjs.com/package/express-acl)
    *   conditional redirection (e.g. when querying routes you must be logged in to access)

*   user account management
    *   login
    *   logout
    *   create account
    *   deactivate / delete account
    *   password recovey mechanisms
    *   password strength validation
        *   client-side
        *   server-side

*   client-side session state persistence
    *   cookies
    *   LocalStorage & SessionStorage
    *   JSON web tokens (see below - involves more than just client-side session state persistence)

*   JSON web tokens
    *   token creation
    *   client & server token consumption
    *   token 'staleness' (for session expiry)
    *   token removal / invalidation / blacklisting

*   server-side authentication strategies
    *   auth "strategies" concept
        *   [passport](https://www.npmjs.com/package/passport)
        *   [passport-strategy](https://www.npmjs.com/package/passport-strategy)
    *   specific strategies
        *   custom authentication type creation
            *   [passport-custom](https://www.npmjs.com/package/passport-custom)
        *   local authentication
            *   [express-user-local](https://www.npmjs.com/package/express-user-local)
        *   third-party / external authentication (via Google, Facebook, etc.)
            *   [passport-google-oauth20](https://www.npmjs.com/package/passport-google-oauth20)
            *   [passport-facebook](https://www.npmjs.com/package/passport-facebook)
            *   [passport-facebook-token](https://www.npmjs.com/package/passport-facebook-token)

*   server-side session storage (related: database storage ==> session storage)
            *   also requires shallow knowledge of many, deep knowledge of a few
    *   in-memory session storage
        *   [express-session](https://www.npmjs.com/package/express-session)
            *   uses this type of session storage by default
    *   SQL db session storage (postgres, mssql)
        *   [connect-mssql](https://www.npmjs.com/package/connect-mssql)
        *   [express-mysql-session](https://www.npmjs.com/package/express-mysql-session)
        *   [connect-pg-simple](https://www.npmjs.com/package/connect-pg-simple)
    *   key-value db storage (Redis store)
        *   [redis-sessions](https://www.npmjs.com/package/redis-sessions)
        *   [node-redis-session](https://www.npmjs.com/package/node-redis-session)
    *   document db storage (Mongo store)
        *   [connect-mongodb-session](https://www.npmjs.com/package/connect-mongodb-session)
    *   db-agnostic (ORM-based) session storage (Knex store)
        *   [connect-session-knex](https://www.npmjs.com/package/connect-session-knex)
    *   file-based session storage (store session data in a session file)
        *   [session-file-store](https://www.npmjs.com/package/session-file-store)
    *   cookie-based sessions
        *   [cookie-session](https://www.npmjs.com/package/cookie-session)

*   HTTP header parsing

Auth practice creation order
============================
1.  ! plain pwd-username, in code
2.  ! hashed pwd-username, sent and found in code
3.  ! JSON token created
4.  ! JSON token created, used to authenticate a specific route
    *   tested to ensure slight mangling of the token kills the auth. It does.
5.  Getting the token into the client non-manually

