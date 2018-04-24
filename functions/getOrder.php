<?php
  $id = $_POST['id'];
  require('functions/overall/getData.php');
  $squery =  "SELECT d.*, f.name FROM `details` d
              INNER JOIN `food` f ON d.food_id = f.id 
              WHERE order_id = '$id'";
  $datos=getData($squery);
  echo json_encode($datos);
  
?>