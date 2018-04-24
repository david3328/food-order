<?php
  session_start();
  if($_POST or $_GET){
    require('config/core.php');
    switch(isset($_GET['mode']) ? $_GET['mode'] : null){
      case 'login':
        require('functions/goLogin.php');
        break;
      case 'getFood':
        require('functions/getFood.php');
        break;
      case 'getOrders':
        require('functions/getOrders.php');
        break;
      case 'getOrder':
        require('functions/getOrder.php');
        break;
      case 'addOrder':
        require('functions/addOrder.php');
        break;
      case 'serviceOrder':
        require('functions/serviceOrder.php');
        break;
      case 'deleteOrder':
        require('functions/deleteOrder.php');
        break;
      default:
        header('location:index.php');
        break;
    }
  }else{
    header('location:index.php');
  }
?>