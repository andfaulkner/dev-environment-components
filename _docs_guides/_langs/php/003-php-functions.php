<!doctype html>
<html>
<body>

<div>
    <!------------------------------------ BASIC FUNCTIONS ------------------------------------>
    <?php
        // Define a basic function.
        function hello_world() {
            return "Hello world!";
        }

        // Call a basic function and display result.
        echo hello_world();
    ?>
</div>

<div>
    <!--------------------------------- FUNCTIONS WITH PARAMS --------------------------------->
    <?php
        function hello_name($name) {
            return "Hello $name!";
        }

        echo hello_name("Meeka");
    ?>
</div>

<div>
    <!------------------------ RECURSIVE FUNCTIONS & DEFAULT ARGUMENTS ------------------------>
    <?php
        function insert_odd_numbers($arr, $max_num, $cur_num = 0) {
            $new_num = $cur_num;
            if ($cur_num > $max_num) {
                return $arr;
            }

            elseif ($cur_num % 2) {
                array_push($arr, $new_num);
                $new_num = $new_num + 2;
            }

            elseif (!($new_num % 2)) {
                $new_num = $new_num + 1;
                array_push($arr, $new_num);
                $new_num = $new_num + 2;
            }
            return insert_odd_numbers($arr, $max_num, $new_num);
        }

        $result = insert_odd_numbers([], 20);
        print_r($result);
    ?>
</div>

<div>
    <!--------- FUNCTIONS WITH ARGS PASSED BY REFERENCE (MODIFIABLE FROM INSIDE FUNCTION) --------->
    <?php
        function add_two_mutative(&$outside_num) {
            $outside_num = $outside_num + 2;
            return $outside_num;
        }

        $num = 10;
        add_two_mutative($num);
        add_two_mutative($num);
        print_r($num); // => 14
    ?>
</div>

<!--
    NOTE: Functions are first-class.
    @TODO Create doc for first-class functions.
-->

</body>

</html>
