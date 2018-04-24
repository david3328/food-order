<?php

session_start();

require('config/core.php');

if(isset($_GET['view'])){
  if(file_exists('controllers/'.strtolower($_GET['view']).'Controller.php')){
    include('controllers/'.strtolower($_GET['view']).'Controller.php');
  }else{
    include('controllers/errorController.php');
  }
}else{
  include('controllers/indexController.php');
}

?>