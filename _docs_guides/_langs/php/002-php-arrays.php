<!doctype html>
<html>
<body>
    <?php
        /*********************** CREATING ARRAYS ***********************/
        // CREATE SIMPLE ARRAY
        $simple_arr = ["numero uno!", "numero dos!", "numero tres!", "numero quatro!"];

        // DISPLAY ITEM FROM SIMPLE ARRAY
        echo "<br>First item from \$simple_arr: $simple_arr[0]<br>";

        // CREATE ARRAY WITH FUNCTION
        $test_array = array("Meeka", "Callie", "Logan");
        echo "$test_array[0]";

        // DISPLAY ARRAY FOR DEBUGGING
        print_r($test_array);

        /******************** LOOPING THROUGH ARRAYS ********************/
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

        /************************** MODIFYING ARRAYS **************************/
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
    ?>
</body>

</html>
