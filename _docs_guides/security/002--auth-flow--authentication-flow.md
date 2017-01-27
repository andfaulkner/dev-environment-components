Authentication flow
===================

Simple flow - example 1
-----------------------
    1.  User enters username and password
    2.  The application checks if they are matching
    3.  If they are matching, it sends a Set-Cookie header that will be used to authenticate further pages
    4.  When the user visits pages from the same domain, the previously set cookie will be added to all the requests
    5.  Authenticate restricted pages with this cookie

Steps to auth with passport
---------------------------
1)  instantiate Express
2)  Add data parsing middlewares (body-parser, cookie-parser)
3)  Add session middleware (express-session)
4)  Add + initialize passport middleware (app.use(passport.initialize()));
4)  Add passport session middleware (app.use(passport.session()));
5)  Add unprotected routes (e.g. public, static, assets)
6)  Passport authentication config (attach strategy here)