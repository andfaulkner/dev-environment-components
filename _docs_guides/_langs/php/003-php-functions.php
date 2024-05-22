<!doctype html>
<html>
<body>

<div>
    <!------------------------------------ BASIC FUNCTIONS ------------------------------------>
    <?php
    // Define a basic function.
    function hello_world(): string {
        return "Hello world!";
    }

    // Call a basic function and display result.
    echo hello_world();
    ?>
</div>

<div>
    <!--------------------------------- FUNCTIONS WITH PARAMS --------------------------------->
    <?php
    function hello_name($name): string {
        return "Hello $name!";
    }

    echo hello_name("Meeka");
    ?>
</div>

<div>
    <!------------------------ RECURSIVE FUNCTIONS & DEFAULT ARGUMENTS ------------------------>
    <?php
    /**
     * @param $arr array<int>
     * @param $end_num int
     * @param $start_num int
     * @return array<int>
     */
    function fill_with_odd_numbers(array $arr, int $end_num, int $start_num = 0): array {
        $new_num = $start_num;
        if ($start_num > $end_num) return $arr;

        if (!($new_num % 2)) {
            $new_num = $new_num + 1;
        }

        $arr[] = $new_num; // Same as: array_push($arr, $new_num);
        $new_num = $new_num + 2;
        return fill_with_odd_numbers(arr: $arr, end_num: $end_num, start_num: $new_num);
    }

    $result = fill_with_odd_numbers(arr: [], end_num: 20);
    print_r(value: "Odd numbers from 0 to 20: " . join(', ', $result) . '<br />');

    $result2 = fill_with_odd_numbers(arr: [], end_num: 30, start_num: 10);
    print_r(value: "Odd numbers from 10 to 30: " . join(', ', $result2));
    ?>
</div>

<div>
    <!--------- FUNCTIONS WITH ARGS PASSED BY REFERENCE (MODIFIABLE FROM INSIDE FUNCTION) --------->
    <?php
    function add_two_mutative(int &$outside_num): int {
        $outside_num = $outside_num + 2;
        return $outside_num;
    }

    $num = 10;
    add_two_mutative(outside_num: $num);
    add_two_mutative(outside_num: $num);
    print_r($num); // => 14
    ?>
</div>

<div>
    <!---------------------------- PASS-BY-REFERENCE PARAMETERS ---------------------------->
    <!-- Allows mutation of outer variables -->
    <!-- I'm not a big fan of this -->
    <?php
    $my_var = 7;
    function add_10_to_outer(&$var): void {
        $var = $var + 10;
    }

    function add_10_to_inner_only($var): void {
        $var = $var + 10;
    }

    echo "<br />Initial my_var val: $my_var"; // 7

    /** @noinspection PhpExpressionResultUnusedInspection */
    add_10_to_inner_only($my_var);
    echo "<br />my_var val after add_10_to_inner_only X1: $my_var"; // 7

    /** @noinspection PhpExpressionResultUnusedInspection */
    add_10_to_inner_only($my_var);
    echo "<br />my_var val after add_10_to_inner_only X2: $my_var"; // 7

    add_10_to_outer($my_var);
    echo "<br />my_var val after add_10_to_outer: $my_var" // 17
    ?>

</div>

<div>
    <!---------------------------- FIRST-CLASS FUNCTIONS ---------------------------->
    <!-- Arrow functions -->
    <?php
    $adder = fn($num1, $num2) => $num1 + $num2;
    echo "Result from adder arrow function: " . $adder(5, 6);
    ?>
</div>
<div>
    <?php
    $subtractor = fn($num1, $num2) => $num1 - $num2;
    echo "Result from subtractor arrow function: " . $subtractor(5, 6);
    ?>
</div>

    <!----------------------------------- CLOSURES ----------------------------------->
<div>
    <?php
    //
    // Method 1: "use" keyword in function declaration
    //
    $counter = 0;

    // Note that pass-by-reference is required to access the outer variable.
    $hello_counter = function() use (&$counter): void {
        $counter = $counter + 1;
    };

    $hello_counter();
    $hello_counter();
    echo $counter; // 2

    //
    // Method 2: "global" keyword
    //
    $counter2 = 0;

    $hello_counter2 = function(): void {
        global $counter2;
        $counter2 = $counter2 + 1;
    };

    $hello_counter2();
    $hello_counter2();
    echo $counter2; // 2
    ?>
</div>

    <!-------------------------------- STATIC VARIABLES -------------------------------->
<div>
    <?php
    // The static keyword keeps the value in the function between calls to the function.
    // Very similar to setState hooks in React.
    function add_to_running_total(float|int $cost): float|int {
        static $total = 0;
        $total += $cost;
        return $total;
    }

    $running_total = add_to_running_total(cost: 100);
    echo "Total after adding 100: " . $running_total . "<br />";
    $running_total = add_to_running_total(cost: 100);
    echo "Total after adding 100 again: " . $running_total;

    ?>
</div>


<!--
    NOTE: Functions are first-class.
    @TODO Create doc for first-class functions.
-->

</body>

</html>
