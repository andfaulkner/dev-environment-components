<?php
    error_reporting(E_ALL);

    // PROBABLY DON'T USE THESE
    // See https://eliasvo.wordpress.com/2015/06/07/php-traits-if-they-werent-evil-theyd-be-funny/

    print_r("<br />OK: 006-php-traits.php loaded");

    // Mechanism for code reuse.
    // Lets you reuse sets of methods in multiple independent classes in
    // different class hierarchies.
    //
    // Cannot instantiate a Trait on its own.
    //
    // Basically mixins.

    trait greeter {
        public function say_hello() {
            echo "<br />";
            echo "Hello!";
        }
    }

    /**
     * Example class
     */
    class ExampleClass {
        use greeter;
        const EXAMPLE = "Example constant";
        const ID = "123456789";
        const Gr = "Argh";

        function __construct()
        {
            echo "Created " . ExampleClass::class;
        }
    }

    $example = new ExampleClass();

    echo $example->say_hello();

    // WIP
    // @TODO Complete traits
?>
