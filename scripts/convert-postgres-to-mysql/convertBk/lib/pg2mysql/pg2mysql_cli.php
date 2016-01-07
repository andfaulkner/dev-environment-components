<?php

include 'pg2mysql.inc.php';


if (empty($argv[1])) {
	echo 'Usage: php pg2mysql_cli.php <inputfilename> <outputfilename> [engine]\n';
	exit;

} else if (empty($argv[2])) {
		error_reporting(0);
		pg2mysql_large($argv[1]);

} else if (isset($argv[1]) && isset($argv[2])) {
	if(isset($argv[3])) {
		$config['engine']=$argv[3];
	}
	pg2mysql_large($argv[1],$argv[2]);
}
