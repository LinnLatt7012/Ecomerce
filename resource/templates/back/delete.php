<?php 
require_once("../../config.php");
if(isset($_GET['delete_order'])){
    $order_id =escape_string ($_GET['delete_order']);
    $query= query("DELETE from orders where order_id=".$order_id." ");
    confirm_q($query);
    set_msg("Orders,{$order_id}, is deleted");
    redirect("../../../public/admin/index.php?orders");
}else if(isset($_GET['delete_product'])){
    $product_id =escape_string ($_GET['delete_product']);
    $query= query("DELETE from product where product_id=".$product_id." ");
    confirm_q($query);
    set_msg("Orders,{$product_title}, is deleted");
    redirect("../../../public/admin/index.php?products");
}else if(isset($_GET['delete_cat'])){
    $cat_id =escape_string ($_GET['delete_cat']);
    $query= query("DELETE from categories where cat_id=".$cat_id." ");
    confirm_q($query);
    set_msg("Category,{$cat_id}, is deleted");
    redirect("../../../public/admin/index.php?categories");
}else if(isset($_GET['delete_user'])){
    $user_id =escape_string ($_GET['delete_user']);
    $query= query("DELETE from users where user_id=".$user_id." ");
    confirm_q($query);
    set_msg("User ,{$user_id}, is deleted");
    redirect("../../../public/admin/index.php?users");
}else{
    set_msg("ERROR");
    redirect("../../public/admin/index.php?orders");
}






?>