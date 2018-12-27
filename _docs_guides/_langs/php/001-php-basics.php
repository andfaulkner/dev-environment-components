<!doctype html>
<html>

<body>
    <!-- Regular HTML still works -->
    <div>Hello PHP!</div>

    <!-- PHP code goes into the following type of block -->
    <?php
        // OUTPUT TEXT
        echo "<div>Hello from inside PHP block!</div>";

        // DECLARE VARIABLES
        $num_var = 12;
        $string_var = "SOME VALUE";

        echo "Number variable: $num_var";
        echo "String variable: $string_var";

        // BOOLEANS:   True, False
        // NULL VALUE: Null

        // Create if statement
        if (True) {
            echo "\nTRUE!";
        }

        // CREATE FOR LOOP
        for ($i=0; $i < 10; $i++) {
            echo "<div>$i</div>";
        }

        /************************************** ARRAYS **************************************/
        // CREATE SIMPLE ARRAY
        $simple_arr = ["numero uno!", "numero dos!", "numero tres!", "numero quatro!"];

        // DISPLAY ITEM FROM SIMPLE ARRAT
        echo "<br>First item from \$simple_arr: $simple_arr[0]<br>";

        // CREATE ARRAY WITH FUNCTION
        $test_array = array("Meeka", "Callie", "Logan");
        echo "$test_array[0]";

        // LOOP THROUGH ARRAY - BASIC
        echo "<br>Looping through array: ";
        foreach ($test_array as $item) {
            echo "<span>$item; </span>";
        }

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
    ?>
</body>

</html>
