<?php

// Connect to DB
$connection = new PDO("pgsql:host=localhost;dbname=postgres;", "andrew");

// Request first & last name from DB
$result = $connection->query('SELECT first_name, last_name FROM starter_data');

// Create array of objects from DB data:
//     PDO::FETCH_ASSOC :: returns associative array
//     PDO::FETCH_NUM   :: returns enumerated  array
$dogs = array();
while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
    $dogs[] = $row;
}

$connection = null;

/***** IMPORT THE HTML TEMPLATE *****/
// To work, this file must define a $dogs array
require 'templates/list.php';

?>
