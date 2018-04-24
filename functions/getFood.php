<?php
  require('functions/overall/getData.php');
  $squery = "SELECT * FROM food";
  $datos=getData($squery);
  echo json_encode($datos);
  
?>