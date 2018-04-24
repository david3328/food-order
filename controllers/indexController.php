<?php
  if($_SESSION){
    $type = $_SESSION[MY_SESSION][0]['type'];
    if($type==0){
      include('views/html/food.html');
    }else{
      include('views/html/order.html');
    }
  }else{
    include('views/html/login.html');
  }
?>