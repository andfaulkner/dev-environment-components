<?php

    namespace PHPConstantsLearning;

    /****************** CONSTANTS VIA const KEYWORD ******************/
    // "const" keyword defines constants at compile time.
    // Cannot be used to conditionally define constants (whereas "define" below can).

    // Defines an immutable constant.
    const ANIMAL_TYPES = ["Dog", "Cat", "Lizard", "Bear", "Yak"];

    /****************** CONSTANTS VIA define ******************/
    // "define" function defines constants at runtime.
    // Can be used to conditionally define constants (unlike "const" keyword).

    // This can only be retrieved with constant().
    // Globally available this way.
    define("NUM_MAMMAL_LEGS", 4);

    // Retrieve constant defined with define().
    $num_legs = constant("NUM_MAMMAL_LEGS");

    $fname =  "005-php-constants :: ";
    echo $fname . "NUM_MAMMAL_LEGS: " . $num_legs . "<br />";

    /****************** CLASS CONSTANTS ******************/
    /**
     * Class containing a constant.
     */
    class Fruit
    {
        const IS_DELICIOUS = "True";
        const CAN_TALK = "False";

        var $colour;
        var $name;

        function __construct($colour, $name)
        {
            $this->$colour = $colour;
            $this->$name = $name;
            echo "Constructed " . Fruit::class;
        }

        static function get_constants() {
            // Get "Reflection" object for current class.
            $reflection = new \ReflectionClass(__NAMESPACE__ . '\\Fruit');

            // Get all constants for current class off "Reflection" object
            return $reflection->getConstants();
            // Equivalent to:
            //     return array(
            //         'IS_DELICIOUS' => self::IS_DELICIOUS,
            //         'CAN_TALK'     => self::CAN_TALK
            //     );
        }
    }
?>
