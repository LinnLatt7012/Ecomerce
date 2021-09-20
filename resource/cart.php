<?php
require_once("../resource/config.php");

?>

<?php
if(isset($_GET['add'])){
    $query = query("Select * from product where product_id =".escape_string($_GET['add'])."");
    confirm_q($query);
    if(!isset($_SESSION['product_'.$_GET['add']])){
        $_SESSION['product_'.$_GET['add']] =0;
    }
    while($row = fetch_array($query)){
        if($row['product_quantity'] != $_SESSION['product_'.$_GET['add']]){
            $_SESSION['product_'.$_GET['add']] +=1;
            redirect("../public/checkout.php");
        }else if($row['product_quantity'] == 0){
            set_msg($row['product_title']." "." isn't available Anymore");
            redirect("../public/checkout.php");
        }else{
            set_msg("We only have ".$row['product_quantity']." "." of".$row['product_title']." available right now");
            redirect("../public/checkout.php");
        }
    }
    // $_SESSION['product_'.$_GET['add']] +=1;
    // redirect("index.php");  
}
if(isset($_GET['remove'])){
    if($_SESSION['product_'.$_GET['remove']]<1){
        redirect ("../public/checkout.php");
    }else{
        $_SESSION['product_'.$_GET['remove']]--;
        redirect("../public/checkout.php");
    }
}

if(isset($_GET['delete'])){
    $_SESSION['product_'.$_GET['delete']]=0;
    unset($_SESSION['product_'.$_GET['delete']]);
    redirect("../public/checkout.php");
}

function cart()
{ 
    $total = 0;
    $items = 0;
    $item_name = 1;
    $item_number =1;
    $amount = 1;
    $quantity =1;
    foreach ($_SESSION as $name => $value) {
        if($value>0){
        if (substr($name, 0, 8) == "product_") {
            $length = strlen($name) - 8;
            $num = substr($name, 8, $length);
            // echo is_numeric($length);
            $query = query("SELECT * from product where product_id=" . escape_string($num) . "" . "");
            confirm_q($query);
            while ($row = fetch_array($query)) {
                $sub_total = multi($value, $row["product_price"]);
                $cart = <<<DELIMETER
                <tr>
                    <td>{$row["product_title"]} <br>
                    <img src="../resource/uploads/{$row["product_image"]}"  height="100px"></td>
                    <td>&#36;{$row["product_price"]}</td>
                    <td>
                    <a href="../resource/cart.php?remove={$row["product_id"]}"><span class='glyphicon glyphicon-minus'></span></a>
                    <p style="width: 30px; display:inline-block; text-align: center;">{$value}</p> 
                    <a href="../resource/cart.php?add={$row["product_id"]}"><span class='glyphicon glyphicon-plus'></span></a></td>
                    <td>&#36;{$sub_total}</td>
                    <td><a class='btn btn-danger' href="../resource/cart.php?delete={$row["product_id"]}"><span class='glyphicon glyphicon-remove'></a></td>
                </tr>
<input type="hidden" name="item_name_{$item_name}" value="{$row['product_title']}">
<input type="hidden" name="item_number_{$item_number}" value="{$row['product_id']}">
<input type="hidden" name="amount_{$amount}" value="{$row['product_price']}">
<input type="hidden" name="quantity_{$quantity}" value="$value">
DELIMETER;
                echo $cart;
                $item_name++;
                $item_number++;
                $amount++;
                $quantity++;
                $items += $value;
                $total += $sub_total;
            }
        }

    }
    }
    $_SESSION['checkout_total'] = $total;
    $_SESSION['item_quantity'] = $items;
}

function show_paypal() {
    if(isset($_SESSION['item_quantity']) && $_SESSION['item_quantity'] >= 1) {
    
    $paypal_button = <<<DELIMETER
    
        <input type="image" name="upload" border="0"
    src="https://www.paypalobjects.com/en_US/i/btn/btn_buynow_LG.gif"
    alt="PayPal - The safer, easier way to pay online">
    
    
DELIMETER;
    
    return $paypal_button;
    
    }else{
        $error = "there is no item in cart";
        return $error;
    }
}

function process_transaction() {
if(!isset($_GET['payment'])){
    if(isset($_GET['tx'])) {
        $amount = $_GET['amt'];
        $currency = $_GET['cc'];
        $transaction = $_GET['tx'];
        $status = $_GET['st'];
        $total = 0;
        $item_quantity = 0;
        $date = date("Y-m-d");
$send_order = query("INSERT INTO orders (order_date, order_amount, order_transaction, order_currency, order_status ) VALUES('{$date}','{$amount}', '{$transaction}','{$currency}','{$status}')");
    confirm_q($send_order);    
    $last_id =last_id();
    foreach ($_SESSION as $name => $value) {

            if($value > 0 ) {
                if(substr($name, 0, 8 ) == "product_") {
                    $length = strlen($name) - 8;
                    $id = substr($name, 8 , $length);
                    $query = query("SELECT * FROM product WHERE product_id = " . escape_string($id). " ");
                    confirm_q($query);
                    while($row = fetch_array($query)) {
                        $product_price = $row['product_price'];
                        $sub = $row['product_price']*$value;
                        $item_quantity +=$value;
                        $insert_report = query("INSERT INTO reports (product_id, order_id, product_quantity)
                         VALUES('{$id}','{$last_id}','{$value}')");
                        confirm_q($insert_report);
                        $left_quantity = $row['product_quantity']-$value;
                        $Update_query = query("Update product Set product_quantity= $left_quantity  WHERE product_id = " . escape_string($id). " ");
                        confirm_q($Update_query);
                    }
                    $total += $sub;
                    unset($_SESSION[$name]);
                }

            }

        }
        // unset($_SESSION['item_quantity']);
        // unset($_SESSION['item_quantity']);
    redirect("thank_you.php?tx=$transaction&payment=done");
    } else {
        redirect("index.php");
    }
}



}

?>