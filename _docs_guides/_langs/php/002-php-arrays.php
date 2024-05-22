<!doctype html>
<html>
<body>
    <?php
    // https://code.tutsplus.com/working-with-php-arrays-in-the-right-way--cms-28606t
    /*=========================== CREATING ARRAYS ===========================*/
    // CREATE SIMPLE ARRAY
    $simple_arr = ["numero uno!", "numero dos!", "numero tres!", "numero quatro!"];

    // DISPLAY ITEM FROM SIMPLE ARRAY
    echo "<br>First item from \$simple_arr: $simple_arr[0]<br>";

    // CREATE ARRAY WITH FUNCTION
    $test_array = array("Meeka", "Callie", "Logan");
    echo "$test_array[0]";

    // DISPLAY ARRAY FOR DEBUGGING
    print_r($test_array);

    /*======================= LOOPING THROUGH ARRAYS ========================*/
    // LOOP THROUGH ARRAY - BASIC
    echo "<br>Looping through array: ";
    foreach ($test_array as $item) {
        echo "<span>$item; </span>";
    }

    $test_array_2 = ["Content", "Goes", "Here"];

    // LOOP THROUGH ARRAY - WITH INDEX USED
    echo "<br>Looping through array: ";

    $loop_count = 0;

    foreach ($test_array as $item) {
        $loop_count = $loop_count + 1;

        if ($loop_count === (count($test_array))) {
            echo "<span>$item.</span>";
        } else {
            echo "<span>$item, </span>";
        }
    }

    $loop_count = Null;

    echo "<br />";

    # LOOPING THROUGH ARRAY WITH INDEX USED, NO LOOP COUNTER
    foreach ($test_array_2 as $key => $value) {
        if ($key === (count($test_array_2) - 1)) {
            echo "<span>$value.</span>";
        } else {
            echo "<span>$value, </span>";
        }
    }


    function display_array($arr) {
        foreach ($arr as $item) {
            echo "$item";
        }
    }

    /*========================== MODIFYING ARRAYS ===========================*/
    $test_array_3 = ["zzz", "yyy", "xxx", "www"];

    /******** REMOVE ITEM FROM ARRAY ********/
    unset($test_array_3[1]); // Removes 2nd item ("yyy")

    echo "<br />";
    print_r($test_array_3);
    // Array ([0] => zzz [2] => xxx [3] => www) // <- Notice no "yyy" present

    echo "<br />";

    /******* PUSH ITEMS TO END OF ARRAY *******/
    array_push($test_array_3, "vvv", "uuu", "ttt");
    print_r($test_array_3);
    // Array ([0] => zzz [2] => xxx [3] => www [4] => vvv [5] => uuu [6] => ttt)

    /*==================== WORKING WITH KEYS AND VALUES =====================*/
    // Create a key-value pair array:
    $hash_array = [1 => "value", 2 => "another value", 3 => "third value"];


    # array
    # array_column
    # array_combine
    # array_count_values
    # array_fill
    # array_fill_keys
    # array_filter
    # array_flip
    # array_key_exists
    # array_keys
    # array_intersect
    # array_map
    # array_merge
    # array_product
    # array_reduce
    # array_search
    # array_sum
    # array_unique
    # array_values
    # array_walk
    # in_array

    /*============================= SORT ARRAYS =============================*/
    /** SORT ARRAYS */
    // sort(): Basic function
    // Can be prefixed. Meanings of prefixes:
    //      a: sort preserving keys
    //      k: sort by keys
    //      r: sort in reverse/descending order
    //      u: sort with a user function
    // Allowed combos:
    //    asort(): sort preserving keys
    //    arsort(): sort preserving keys, in reverse order
    //    uasort(): Sort preserving keys, with a user function.
    //    ksort(): sort by keys
    //    krsort(): sort by keys, in reverse
    //    rsort(): sort in reverse
    //    usort(): sort with a user function

    ?>
</body>

</html>
