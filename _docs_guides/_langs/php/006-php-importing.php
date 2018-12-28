<?php
    error_reporting(E_ALL);

    print_r("<br />OK: 005-php-importing-classes-namespaces-scripts.php loaded");

    //
    // Use require_once() or require() almost always for importing other files.
    //
    // require(): import file, generate fatal error & stop script if it fails.
    // include(): import file, generate warning if it fails.
    // require_once(): same as require, but won't import file more than once.
    // include_once(): same as include, but won't import file more than once.
    //
    // The require() function is identical to include(), except that it handles
    // errors differently. Ditto for require)once and include_once.
    //

    /****************************** IMPORTING ******************************/
    // Includes and evaluates the specified file.
    require_once "./src/included-script.php";
    // => Entered included-script.php.

    require_once "./src/included-script.php";
    // No output, file was already required with require_once.

    /********************* IMPORTING WITH RETURN VALUE *********************/
    // Import and assign to return value.
    $str = require "./src/script-to-require.php";

    print_r("<br />" . $str);

    /*************** IMPORTING NAMESPACES ****************/
    echo "<br />Loading 004-php-classes.php:<br />";

    // Import file with namespace (it's the same).
    require_once('004-php-classes.php');

    // Instantiate object from class in namespace.
    $callie = new \Organisms\Animal("Callie", 15, "Dog");

    echo "<h3 style=\"margin-bottom: 5px;\">Displaying dog object (with namespace):</h3>";
    print_r($callie);
    echo "</div>";

    echo "<br />";

    /*************** IMPORTING CONSTANTS ****************/
    require_once("./005-php-constants.php");

    // Local-only variable - wouldn't be accessible outside
    $cur_file = "<br />006-php-importing.php :: ";
    echo "$cur_file";

    // Show constant defined in namespace.
    print_r(\PHPConstantsLearning\ANIMAL_TYPES);

    // Show constant defined by define() function.
    print_r($cur_file . "NUM_MAMMAL_LEGS: " . constant("NUM_MAMMAL_LEGS"));

    // This wouldn't work:  print_r(\PHPConstantsLearning\NUM_MAMMAL_LEGS);

?>
