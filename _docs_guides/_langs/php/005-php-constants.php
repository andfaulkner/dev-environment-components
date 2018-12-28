<?php

    namespace PHPConstantsLearning;

    /****************** CONSTANTS VIA KEYWORD ******************/
    // Define an immutable constant.
    const ANIMAL_TYPES = ["Dog", "Cat", "Lizard", "Bear", "Yak"];

    /****************** CONSTANTS VIA define ******************/
    // This can only be retrieved with constant().
    define("NUM_MAMMAL_LEGS", 4);

    // Retrieve constant defined with define().
    $num_legs = constant("NUM_MAMMAL_LEGS");

    $fname =  "005-php-constants :: ";
    echo $fname . "NUM_MAMMAL_LEGS: " . $num_legs . "<br />";
?>
