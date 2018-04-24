<?php
  require_once('models/class.Conexion.php');
  function getData($query) {
    $bd=new Conexion();
    $sql = $bd->query($query);
    if($bd->rows($sql) > 0){
        $return_array = array();
        while($row = mysqli_fetch_assoc($sql)){
            array_push($return_array,$row);
        }
        $bd->liberar($sql);
        $bd->close();
        return $return_array; 
    }else{
        $bd->liberar($sql);
        $bd->close();
        return false;
    }
  }
?>