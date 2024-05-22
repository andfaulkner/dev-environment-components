<?php
// Clone an object
$orig_obj = new DirectoryIterator(dirname(__FILE__));

// Iterate through orig_obj
foreach ($orig_obj as $file_info) {
    echo "<br /><br /><br />";

    // This will cause the file_info_local to be iterated through every time the loop goes
    // If we didn't use a clone here, we'd iterate through here just once, because the iterator
    // would resolve as soon as the below foreach loop completed.
    $file_info_local = clone $file_info;
    foreach ($file_info_local as $item) {
        echo "<span style='margin-left:15px;'>$item" . "</span></br>";
    }
    var_dump($file_info);
}
?>