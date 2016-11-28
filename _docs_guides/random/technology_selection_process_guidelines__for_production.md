Technology selection process
============================

Note: this only applies to projects intended for production. If it's a toy project just for fun,
skip right to step 13. Or (I hope this goes without saying) if the project is solely to learn a new
language, obviously use that language (or if it's to learn a library, use whatever language the
library is written in).

Steps
-----
1)  Outline the exact requirements.
    *   What platforms must it run on?
    *   What kinds of API-offloadable functionality will it require? (e.g. authentication)
    *   Is it performance-intensive? (i.e. is it a game?)
    *   Is it exploratory? Is it a prototype?
    *   How large is the application?
2)  Narrow the list of languages to those that can run on all required platforms, or be easily
    transpiled to do so (e.g. if you're making a DLL / API that needs to run in both a browser
    and on Android, Kotlin and Clojure are viable options, but this rules out Java)
3)  Narrow the list of languages to those that have frameworks and libraries that meet all app
    requirements. E.g. if a large, complex web server is required, this would rule out C. If
    ultra-high-performance is needed, this rules out Ruby. If rapid prototyping is required, it
    rules out C++. If microchip interop is needed, you can rule out, 
4)  Further narrow this to exclude those that do not have battle-tested, production-ready
    solutions. E.g. if you need something to run on a web server, on Android, and on iOS, this
    would rule out Ruby (RubyMotion is questionably production-ready).
5)  If only one language remains that meets all requirements at this point, select it. If there is
    more than one viable framework that meets your needs, repeat the process for frameworks in the
    language. If there is only one, use that framework (assumming a framework is required).
    If more than one language remains, continue to step 6. From here forward, exit the process as
    soon as you've narrowed it to one language (and / or one framework / library)
6)  Narrow the list to exclude languages that no developers on the existing team know, unless no
    one on the team knows any of the remaining options - in which case move to step 7.
    6.a)  If more than one language remains that more than one developer on the team knows, and
          one language has more team members that know it, select that language. Otherwise go to
          step 7.
7)  Rule out any remaining languages/frameworks that are considered a "sinking ship" choice for your
    use case, with a clear preferred alternative. e.g. for web frameworks, this step would rule out
    AngularJS 1.
8)  Examine the ecosystem for packages, libraries, blog posts, Stack Overflow questions and answers.
    etc.. If one of the remaining languages has a clear advantage in overall community adoption,
    select that one.
    *   Note: this refers to adoption for your general use-case. For example (as of 2014), if we're
        making an internet of things device with Arduino, C++ would win in this step over
        Javascript, because Javascript has very few Arduino libraries compared to C++ (since C++ is
        the language the Arduino APIs are written in) - even though there is a larger JS community
        overall (in terms of online presence at least)
9)  Does one of the remaining languages run without transpilation into more that one other
    language? If so, select that one.
    *   Note: transpilation into a _single_ other language is deliberately excluded. For example,
        if we're making an isomorphic server-client app, this step would not knock out Coffeescript,
        Typescript, or Clojurescript, because all three run in both required environments
10) Still haven't narrowed it down to one? Create a hello world app that runs on all required
    platforms in each remaining language, using the sanest framework choice (see step 5). Use
    whichever made the hello world app easier to construct.
11) If you still haven't narrowed it down to one, and you don't know any of the available choices,
    select whichever language is reportedly easier to learn. This is subjective, but in certain
    cases the idea can be gleaned from the community. Research online to get an idea from the
    community. In some cases a near-consensus can be found - e.g. as far as community opinion is
    concerned, C++ is almost inarguably harder to learn than Python. This step would knock C++ out
    if both Python and C++ are still in the running at this step.
12) If you're still not down to one, performance is not a major concern but still has a small role
    to play, and one of the remaining languages is clearly more performant, choose the more
    performant language.
    *   Note that this should not consider small performance differences - e.g. this step would
        have no impact if deciding between Ruby and Python, but if you're down to Javascript vs.
        Ruby, this step would select Javascript.
13) Still aren't down to 1?  Geez, what kind of crazy-ass project is this? How does this even
    happen? OK, fine, pick whichever remaining choice you like the most.
    *   this is obviously extremely subjective, but we've run out of deductive / inductive
        logic-based choices at this point.
    *   Although it's arguably not THAT subjective. You're going to be using your selection day-in,
        day-out, and using a language you hate is going to be demotivating, and thus reduce your
        productivity, and encourage bad practices and "rushing" behaviour (thus increasing bugs).
        There is thus some objective advantages to using this criterion, as the final step in the
        selection process if a decision still remains to be made by this step...even though it's
        low-priority.
    *   E.g. given a choice between Erlang and Elixir for server development, Elixir will (likely)
        usually win in this step (for most teams) since Elixir exists to apply Ruby's "developer
        happiness" motivation / philosophy to Erlang VM development.
        *   (Obviously this is a guess, but the usage stats on Elixir and Erlang and the Ruby-like
            waxing poetic frequently seen online about Elixir's syntax suggests this is the case.
            But I digress)
14) If you really don't favour one over the other, choose whichever is the infinitesimally more
    popular choice for your use case
    *   I say "infinitesimally" because steps 7 and 8 pretty much guarantee all remaining options
        by this step are going to have similar levels of popularity

If you still haven't made a decision...well, this has never happened to me. Figure it out yourself.
Change careers maybe. I don't know. It surprises me that you reached step 13, and surprises me even
more that you reached it then didn't 
