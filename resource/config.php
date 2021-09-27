<?php
ob_start();
session_start();
$image_directory="uploads";
// session_destroy();
defined ("DS") ? null: define("DS",DIRECTORY_SEPARATOR);//Define what separate need to use 

defined ("DIRE") ? null: define("DIRE", __DIR__);
defined ("TEMPLATE_FRONT") ? null: define("TEMPLATE_FRONT", __DIR__.DS."templates\\front");
defined ("TEMPLATE_BACK") ? null: define("TEMPLATE_BACK", __DIR__.DS."templates\\back");
defined ("UPLOAD_DIR") ? null: define("UPLOAD_DIR", __DIR__.DS.$image_directory);
//echo "<h1>".TEMPLATE_FRONT."</h1>";

defined ("DB_HOST") ? null: define("DB_HOST","mysql-52092-0.cloudclusters.net");
defined ("DB_USER") ? null: define("DB_USER","admin");

defined ("DB_PASS") ? null: define("DB_PASS","70128910");
defined ("DB_NAME") ? null: define("DB_NAME","ecom_db");

$connection =mysqli_connect(DB_HOST,DB_USER,DB_PASS,DB_NAME,"10666");

require_once("function.php");

?>