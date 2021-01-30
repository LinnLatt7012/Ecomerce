<?php

function last_id(){

    global $connection;
    
    return mysqli_insert_id($connection);
    
    
    }

//helper function
function set_msg($msg)
{
    if (!empty($msg)) {
        $_SESSION['message'] = $msg;
    }
    else {
        $msg = "";
    }
}
function display_msg()
{
    if (isset($_SESSION['message'])) {
        echo $_SESSION['message'];
        unset($_SESSION['message']);
    }
}

function redirect($location)
{
    header("location: $location");
}

function confirm_q($result)
{
    global $connection;
    if (!$result) {
        die("Query Failed" . mysqli_error($connection));
    }
}

function query($sql)
{
    global $connection;
    return mysqli_query($connection, $sql);
}

function escape_string($string)
{
    global $connection;
    return mysqli_real_escape_string($connection, $string);

}

function fetch_array($result)
{
    return mysqli_fetch_array($result);
}

function display_image($pic){
    Global $image_directory;
    return $image_directory.DS.$pic;
}
/***********************************************@DataBase Command@********************************************/
//get products
// `product_id` INT(11) NOT NULL AUTO_INCREMENT , 
// `product_title` VARCHAR(255) NOT NULL , 
// `product_category_id` INT(11) NOT NULL , 
// `product_price` FLOAT(11) NOT NULL ,
// `product_description` TEXT NOT NULL , 
// `product_image` VARCHAR(256) NOT NULL , 

// CREATE TABLE `ecom_db`. ( 
// `order_id` INT(11) NOT NULL AUTO_INCREMENT ,
// `order_amount` FLOAT(11) NOT NULL , 
// `order_transaction` VARCHAR(255) NOT NULL ,
// `order_currency` VARCHAR(255) NOT NULL ,
// `order_status` VARCHAR(255) NOT NULL , 
// PRIMARY KEY (`order_id`))
// ENGINE = InnoDB;

// CREATE TABLE `ecom_db`.`users` 
// ( `user_id` INT NOT NULL ,
//  `username` VARCHAR(255) NOT NULL ,
//   `email` VARCHAR(255) NOT NULL ) ENGINE = InnoDB;

//SELECT order_id ,SUM(product_price*product_quantity) as total FROM `reports` GROUP BY order_id
/***********************************************@FORNTEND FUNCTION@********************************************/
function get_products()
{
    $query = query("SELECT * FROM product");
    confirm_q($query);
    while ($row = fetch_array($query)) {
        $product = <<<DELIMETER
        <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <a href="item.php?P_id={$row["product_id"]}"><img src="../resource/uploads/{$row["product_image"]}" style="height: 150px;" alt=""></a>
                            <div class="caption">
                                <h4 class="pull-right">&#36;{$row["product_price"]}</h4>
                                <h4><a href="item.php?P_id={$row["product_id"]}">{$row["product_title"]}</a>
                                </h4>
                                <p class="seemore" style="height: 80px;";>{$row["product_description"]}</p>
                                <a class="btn btn-primary" target="" href="../resource/cart.php?add={$row["product_id"]}">Add to cart</a>
                            </div>
                        </div>
                    </div>
DELIMETER;
        echo $product;

    }
}
function get_categories()
{
    $query = "SELECT * FROM categories";
    $send_query = query($query);
    confirm_q($send_query);
    while ($row = fetch_array($send_query)) {
        //echo '<a href="category.html?cat='.$row['cat_title'].'" class="list-group-item">'.$row['cat_title'].'</a>';
        //echo "<a href='category.php?cat={$row['cat_id']}' class='list-group-item'>{$row['cat_title']}</a>";
        if (isset($_GET['cat_id'])) {
            if ($_GET['cat_id'] == $row['cat_id']) {
                $cat_link = <<<DELIMETER
                <a href='category.php?cat_id={$row['cat_id']}' class=' list-group-item ' style="background-color: rgba(54, 54, 54, 0.459);">{$row['cat_title']}</a>
DELIMETER;
            }
            else {
                $cat_link = <<<DELIMETER
                <a href='category.php?cat_id={$row['cat_id']}' class='list-group-item ' >{$row['cat_title']}</a>
DELIMETER;
            }
        }
        else {
            $cat_link = <<<DELIMETER
        <a href='category.php?cat_id={$row['cat_id']}' class='list-group-item '>{$row['cat_title']}</a>
DELIMETER;
        }
        echo $cat_link;
    }
}


function get_products_in_cat_page()
{
    $query = query("SELECT * FROM product where product_category_id = " . escape_string($_GET['cat_id']) . "");
    confirm_q($query);
    while ($row = fetch_array($query)) {
        $product = <<<DELIMETER
<div class="col-md-3 col-sm-6 hero-feature">
<div class="thumbnail">
<a href="item.php?P_id={$row["product_id"]}" ><img src="../resource/uploads/{$row["product_image"]}" alt="" style="height: 300px;";></a>
    <div class="caption">
        <h3>{$row["product_title"]}</h3>
        <p class="seemore" style="height: 80px;"; >{$row["product_description"]}</p>
        <p>
            <a href="../resource/cart.php?add={$row["product_id"]}" class="btn btn-primary">Buy Now!</a> <a href="item.php?P_id={$row["product_id"]}" class="btn btn-default">More Info</a>
        </p>
    </div>
</div>
</div>
DELIMETER;
        echo $product;

    }
}
function get_products_in_shop_page()
{
    $query = query("SELECT * FROM product");
    confirm_q($query);
    while ($row = fetch_array($query)) {
        $product = <<<DELIMETER
<div class="col-md-3 col-sm-6 hero-feature">
<div class="thumbnail">
<a href="item.php?P_id={$row["product_id"]}"><img src="../resource/uploads/{$row["product_image"]}" alt="" style="height: 300px;";></a>
    <div class="caption">
        <h3>{$row["product_title"]}</h3>
        <p>{$row["short_desc"]}</p>
        <p>
            <a href="../resource/cart.php?add={$row["product_id"]}" class="btn btn-primary">Buy Now!</a> <a href="item.php?P_id={$row["product_id"]}" class="btn btn-default">More Info</a>
        </p>
    </div>
</div>
</div>
DELIMETER;
        echo $product;
    }
}


/* */
function login_user()
{
    if (isset($_POST['login_submit'])) {
        $username = escape_string($_POST['username']);
        $password = escape_string($_POST['password']);
        $query = query("SELECT * FROM users where username ='{$username}' and password ='{$password}'");
        confirm_q($query);
        $IsUser = mysqli_num_rows($query);
        if ($IsUser == 0) {
            set_msg("Login failed!!!!!");
            redirect("login.php");

        }
        else {
            $_SESSION['username']=$username;
            //set_msg("Welcome to Admin {$username}!!!!!");
            redirect("admin");
        }

    }
}


function send_message()
{
    if (isset($_POST['submit'])) {
        $to = "plinnlatt70@gmail.com";
        $from_name = $_POST['name'];
        $subject = $_POST['subject'];
        $email = $_POST['email'];
        $message = $_POST['message'];

        $header = "From: {$from_name} {$email}";
        $result = mail($to, $subject, $message, $header);
        if (!$result) {
            echo "Error";
        }
        else {
            echo "Sent";
        }
    }
}

function multi($num1, $num2)
{
    return $num1 * $num2;
}

    
// 2bEO%b1> payment pass per
// linn@bts7 >>business
// `order_id` INT(11) NOT NULL AUTO_INCREMENT ,
// `order_amount` FLOAT(11) NOT NULL , 
// `order_transaction` VARCHAR(255) NOT NULL ,
// `order_currency` VARCHAR(255) NOT NULL ,
// `order_status` VARCHAR(255) NOT NULL ,
/***********************************************@BACKEND FUNCTION@********************************************/

function display_orders(){
    if(isset($_GET['new_order'])){
        $query = query("SELECT  * FROM orders  Order by order_date desc limit 2");
    }else{
    $query = query("SELECT * FROM orders");
    }
    confirm_q($query);
    while ($row = fetch_array($query)) {
        $order = <<<DELIMETER
        <tr>
        <td>{$row['order_id']}</td>
        <td>{$row['order_date']}</td>
        <td>&#36;{$row['order_amount']}</td>
        <td>{$row['order_transaction']}</td>
        <td>{$row['order_status']}</td>
        <td>{$row['order_currency']}</td>
        <td><a class='btn btn-danger' href="../../resource/templates/back/delete.php?delete_order={$row["order_id"]}"><span class='glyphicon glyphicon-remove'></a></td>
        </tr>
DELIMETER;
        echo $order;
    }
}
/*********************************product function******************************************/
function display_product(){
    $query = query("SELECT product.*,categories.cat_title FROM product LEFT JOIN categories 
    ON product.product_category_id = categories.cat_id;");
    
    confirm_q($query);
    // $row = fetch_array($query);
    // print_r($row);
    while ($row = fetch_array($query)) {
        $product = <<<DELIMETER
<tr>
<td>{$row["product_id"]}</td>
<td>{$row["product_title"]}<br>
   <a href= " index.php?edit_product&id={$row["product_id"]}"> <img src="../../resource/uploads/{$row["product_image"]}"  height="100px"></a>
</td>
<td>{$row["cat_title"]}</td>
<td>{$row["product_quantity"]}</td>
<td>{$row["product_price"]}</td>
<td><a class='btn btn-danger' href="../../resource/templates/back/delete.php?delete_product={$row["product_id"]}"><span class='glyphicon glyphicon-remove'></a></td>
</tr>
DELIMETER;
        echo $product;
    }
}




/*********************************addproduct function******************************************/

function add_product(){
    if(isset($_POST['publish'])){

        $title      = escape_string($_POST['product_title']);
        $des        = escape_string($_POST['product_description']);
        $price      = escape_string($_POST['product_price']);
        $cat        = escape_string($_POST['product_category']);
        $sh_des     = escape_string($_POST['product_short_desc']);
        $quan       = escape_string($_POST['product_quantity']);
        $image      = $_FILES['file']['name'];
        $fileTmpname= $_FILES['file']['tmp_name'];
        // $fileSize   = escape_string($_FILES['file']['size']);
        // $fileError  = escape_string($_FILES['file']['error']);
        // $fileType   = escape_string($_FILES['file']['type']);
        $path= UPLOAD_DIR.DS.$image;
        move_uploaded_file($fileTmpname, $path);
        // echo $path;
        // echo $fileTmpname;
        $query = query("INSERT INTO product  (product_title,product_description,product_price,product_category_id,product_quantity,short_desc,product_image) 
                    VALUES('{$title}','{$des}','{$price}','{$cat}','{$quan}','{$sh_des}','{$image}');");
        $last_id= last_id();
        confirm_q($query);
        set_msg("New Product with id, {$last_id}, was added");
        
        redirect ("index.php?products");
 
    }

}

function display_option($id){
    $query = "SELECT * FROM categories";
    $send_query = query($query);
    confirm_q($send_query);
    while ($row = fetch_array($send_query)) {
        if($row["cat_id"]==$id){
            echo '<option value="'.$row["cat_id"].' " selected>'.$row["cat_title"].'</option>';
        }else{
            echo '<option value="'.$row["cat_id"].'">'.$row["cat_title"].'</option>';
        }
    }
    
}


/***********************************************Edit product******************************************/
function edit_product(){
    if(isset($_POST['edit'])){
        $id = $_GET['id'];
    
        $title      = escape_string($_POST['product_title']);
        $des        = escape_string($_POST['product_description']);
        $price      = escape_string($_POST['product_price']);
        $cat        = escape_string($_POST['product_category']);
        $sh_des     = escape_string($_POST['product_short_desc']);
        $quan       = escape_string($_POST['product_quantity']);
        $image      = $_FILES['file']['name'];
        $fileTmpname= $_FILES['file']['tmp_name'];
        // $fileSize   = escape_string($_FILES['file']['size']);
        // $fileError  = escape_string($_FILES['file']['error']);
        // $fileType   = escape_string($_FILES['file']['type']);

        // echo $path;
        // echo $fileTmpname;
        if($_FILES['file']['name']!=null){
        $query= query("SELECT * FROM product where product_id= " . escape_string($_GET['id']) . " ");
        confirm_q($query);
            while($row= fetch_array($query)){
                $pathtodelete= UPLOAD_DIR.DS.$row["product_image"]; 
                unlink($pathtodelete);       
                
            } 
            $path= UPLOAD_DIR.DS.$image;
            move_uploaded_file($fileTmpname, $path);
        }else{
            $query= query("SELECT * FROM product where product_id= " . escape_string($_GET['id']) . " ");
            confirm_q($query);
            while($row= fetch_array($query)){    
                $image= $row["product_image"];
            }
            
        }

        $query = query("UPDATE product  SET
        product_title= '{$title}' ,
        product_description= '{$des}',
        product_price='{$price}',
        product_category_id= '{$cat}',
        product_quantity= '{$quan}',
        short_desc = '{$sh_des}',
        product_image='{$image}' 
        WHERE product_id = " . escape_string($id). " ");
        confirm_q($query);
        set_msg("New Product with id, {$last_id}, was added");
        
        redirect ("index.php?products");
 
    }

}

Function display_cat(){
    $query = "SELECT * FROM categories order by cat_title";
    $send_query = query($query);
    confirm_q($send_query);
    while ($row = fetch_array($send_query)) {
        $category = <<<DELIMETER
<tr>
    <td>{$row["cat_id"]}</td>
    <td>{$row["cat_title"]}</td>
    <td><a class='btn btn-danger' href="../../resource/templates/back/delete.php?delete_cat={$row["cat_id"]}"><span class='glyphicon glyphicon-remove'></a></td>
</tr>
DELIMETER;
        echo $category;

    }
}
function add_cat(){
    if(isset($_POST['Add_Category'])){
        $Cat_name= escape_string($_POST['cat']);
        $query = query("INSERT INTO categories (cat_title) VALUES ('{$Cat_name}')");
        confirm_q($query);
        set_msg("Category, {$Cat_name}, was added.");
        
        redirect ("index.php?categories");
    }
}

Function display_user(){
    $query = "SELECT * FROM users";
    $send_query = query($query);
    confirm_q($send_query);
    while ($row = fetch_array($send_query)) {
        $category = <<<DELIMETER
<tr>
    <td>{$row['user_id']}</td>
    <td><img class="admin-user-thumbnail user_image" src="placehold.it/62x62" alt=""></td>
    <td>{$row['user_name']}
    <div class="action_links">
    <a href="index.php?edit_user&id={$row['user_id']}" class="btn btn-primary">Edit</a>
    </div></td>
    <td>{$row['email']}</td>
    <td>{$row['password']}</td>
    <td><a class='btn btn-danger' href="../../resource/templates/back/delete.php?delete_user={$row["user_id"]}"><span class='glyphicon glyphicon-remove'></a></td>
</tr>
DELIMETER;
        echo $category;

    }
}

function add_user(){
    if(isset($_POST['Add_User'])){
        $user_name= escape_string($_POST['username']);
        $user_gmail= escape_string($_POST['gmail']);
        $user_pwd= escape_string($_POST['password']);
        $query = query("INSERT INTO users (user_name,email,password) VALUES ('{$user_name}','{$user_gmail}','{$user_pwd}')");
        confirm_q($query);
        set_msg("User, {$user_name}, was added.");
        
        redirect ("index.php?users");
    }
}

function edit_user(){
    if(isset($_POST['Edit_User'])){
        $id = $_GET['id'];
        $user_name= escape_string($_POST['username']);
        $user_gmail= escape_string($_POST['gmail']);
        $user_pwd= escape_string($_POST['password']);
        $query = query("UPDATE users  SET 
        user_name='{$user_name}',
        email='{$user_gmail}',
        password='{$user_pwd}' 
        WHERE user_id = " . escape_string($id). " ");
        confirm_q($query);
        set_msg("User, {$user_name}, was edited.");
        redirect ("index.php?users");
    }
}
/**********************************************Show Report******************************************************/
Function display_report(){
    $query = "SELECT rp.* ,od.order_date,od.order_transaction, pd.product_title,pd.product_price FROM reports as rp 
    LEFT JOIN  product as pd ON pd.product_id = rp.product_id
    LEFT JOIN orders as od ON od.order_id= rp.order_id; ";
    $send_query = query($query);
    confirm_q($send_query);
    while ($row = fetch_array($send_query)) {
        $category = <<<DELIMETER
<tr>
    <td>{$row['report_id']}</td>
    <td>{$row['order_date']}</td>
    <td>{$row['order_transaction']}</td>
    <td>{$row['product_title']}</td>
    <td>{$row['product_price']}</td>
    <td>{$row['product_quantity']}</td>
    
</tr>
DELIMETER;
        echo $category;

    }
}
?>