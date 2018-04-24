<?php
  require_once('models/class.Conexion.php');
  function execQuery($query) {
    $bd=new Conexion();
    $sql = $bd->query($query);
    if($bd->affected_rows>0){
      $bd->close();
      return true;
    }else{
      $bd->close();
      return false;
    }
  }
?>