*   Never use the Hashie gem: http://www.schneems.com/2014/12/15/hashie-considered-harmful.html

*   Do not subclass Ruby core classes
    *   example article: http://words.steveklabnik.com/beware-subclassing-ruby-core-classes
    *   they have weird behaviour on account of being written directly in C
    *   In particular, do not subclass Hash, Array, or String
        *   String: messes up interpolation.
        *   Array: Constantly converts your custom array's class from the name of your custom
            class to plain old Array (for example)   
    *   With special focus on not subclassing Hash:
             http://tenderlovemaking.com/2014/06/02/yagni-methods-are-killing-me.html
    *   Use delegation instead. E.g. this example delegates to String

            require 'delegate'

            class Name < SimpleDelegator
              def initialize
                super("")
              end
            end


*   Don't worry about test-first. Test everything for sure, but test-first is unneccessary:
        http://david.heinemeierhansson.com/2014/tdd-is-dead-long-live-testing.html


