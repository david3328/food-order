<?php
  require('functions/overall/execQuery.php');
  require('functions/overall/getData.php');

  if( !empty($_POST['details']) and
      !empty($_POST['total']) and
      !empty($_POST['table']) 
  ){
    $details  = json_decode($_POST[details],true);
    $total    = $_POST['total'];
    $table    = $_POST['table'];
    $user_id  = $_SESSION[MY_SESSION][0]['id'];
    $query = "INSERT INTO `order` (`table`,`total`,`user_id`,`status`) VALUES ('$table','$total','$user_id','pendiente')";
    if(!execQuery($query)){
      echo 2;
    }else{
      $id_order = getData("SELECT MAX(id) AS id FROM `order`")[0]['id'];
      $query = "INSERT INTO `details` (`order_id`, `food_id`, `quantity`, `subtotal`) VALUES";
      foreach($details as $detail){
        $id_food  = $detail['id'];
        $quantity = $detail['quantity'];
        $subtotal = (int)$detail['price']*(int)$quantity;
        $query .= "('$id_order','$id_food','$quantity','$subtotal'),"; 
      }
      execQuery(substr ($query, 0, strlen($query) - 1));
      echo 1;
    }
  }else{
    echo 0;
  }
?>