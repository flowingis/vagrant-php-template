<?php

// phpinfo();
// die();

$db = new PDO('mysql:host=localhost;dbname=ideato', 'root', 'root');

   $stmt = $db->query("SELECT * FROM `table`");
   var_dump($stmt->fetchAll(PDO::FETCH_ASSOC));
