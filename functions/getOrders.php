<?php
  require('functions/overall/getData.php');
  $squery = "SELECT * FROM `order` WHERE status='pendiente'";
  $datos=getData($squery);
  echo json_encode($datos);
  
?>