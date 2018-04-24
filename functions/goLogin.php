<?php
  require('functions/overall/getData.php');
  if(!empty($_POST['name']) and !empty($_POST['password'])){
    $name = $_POST['name'];     
    $password = $_POST['password']; 
    $squery = "SELECT id, name, type FROM user WHERE name='$name' and password='$password'";
    $datos=getData($squery);
    if($datos){
      session_start();
      $_SESSION[MY_SESSION] = $datos;
      echo 1;
    }else{
      echo 2;
    }
  }else{
    echo 0;
  }
?>