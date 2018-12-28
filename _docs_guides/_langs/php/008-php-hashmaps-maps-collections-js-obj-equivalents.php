<?php
    error_reporting(E_ALL);
    echo "<br />";

    /******************** Define a new map / hashmap ********************/
    $new_map = [
        'id' => 123,
        'name' => 'Joe'
    ];

    echo "new_map: ";
    print_r($new_map);
    echo "<br /><br />";

    /******************** Get keys from map / hashmap ********************/
    $map_keys = array_keys($new_map);

    echo "Keys of new_map: ";
    print_r($map_keys);
    echo "<br /><br />";

    /******************* Get values from map / hashmap *******************/
    $map_values = array_values($new_map);

    echo "Values of new_map: ";
    print_r($map_values);
?>
