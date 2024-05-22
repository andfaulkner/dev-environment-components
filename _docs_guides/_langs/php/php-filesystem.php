<?php
// Get current file name: __FILE__
echo "Current file name: " . __FILE__;

// Get current directory: dirname(__FILE__)
$cur_dir = dirname(__FILE__);

echo "Current directory: " . dirname($cur_dir);


/*----------------- ITERATE THROUGH ALL FILES IN CURRENT DIR -----------------*/
// Get iterator for going through directory contents.
//
// Note that if printed as-is, it will print a string containing the first value.
// This is weird, horribly unsafe, and I hate it.
$dir = new DirectoryIterator(dirname(__FILE__));
echo "<br />\$dir type: " . gettype($dir);
echo "<br />get_class_methods for \$dir:" . implode(", ", get_class_methods($dir));
echo "<br /><br />";
// Can't do this :: echo "<br />get_class_vars \$dir:" . implode(get_class_vars($dir));

echo "Local directory contents at $cur_dir:";
// Iterate
foreach ($dir as $file_info) {
    if ($file_info->isFile()) {
        $file_name = $file_info->getFilename();
        echo "<br /> <a href=\"$file_name\">" . $file_name . "</a>";
    }
}
?>