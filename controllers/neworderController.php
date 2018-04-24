<?php
  if($_SESSION){
    include('views/html/new-order.html');
  }else{
    header('location:index.php');
  }
?>