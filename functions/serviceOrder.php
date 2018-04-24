<?php
  require('functions/overall/execQuery.php');
  $id = $_POST['id'];
  $query = "UPDATE `order` SET status='completado' WHERE id='$id'";
  execQuery($query);
  echo 1;
?>