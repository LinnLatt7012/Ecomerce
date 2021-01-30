<?php
require_once("..\..\\resource\\config.php");
$active;
// require_once( DIRE.DS."cart.php");
?>
<?php include(TEMPLATE_BACK.DS."header.php") ?>
<?php
if(!isset($_SESSION['username'])){
    redirect("..\..\\public");
} 
?>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Dashboard <small>Statistics Overview</small>
                        </h1>
                        <!-- <h4><display_msg();?></h4> -->
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-dashboard"></i> Dashboard
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row --> 
                <h3 class="text-center bg-warning" > <?php display_msg();?></h3>
                    <?php 
                      
                    if ($_SERVER['REQUEST_URI'] == "/PHPlesson/php_econormece/public/admin/" || $_SERVER['REQUEST_URI'] == "/PHPlesson/php_econormece/public/admin/index.php"){
                        $active="";
                        include(TEMPLATE_BACK.DS."index_content.php");
                    };
                    if (isset($_GET['orders'])){
                        $active="orders";
                        include(TEMPLATE_BACK.DS."orders.php");
                    };
                    if (isset($_GET['products'])){
                        $active="products";
                        include(TEMPLATE_BACK.DS."products.php");
                    };
                    if (isset($_GET['edit_product'])){
                        $active="edit_product";
                        include(TEMPLATE_BACK.DS."edit_product.php");
                    };
                    if (isset($_GET['add_product'])){
                        $active="add_product";
                        include(TEMPLATE_BACK.DS."add_product.php");
                    };
                    if (isset($_GET['categories'])){
                        $active="categories";
                        include(TEMPLATE_BACK.DS."categories.php");
                    };
                    if (isset($_GET['users'])){
                        $active="users";
                        include(TEMPLATE_BACK.DS."users.php");
                    };
                    if (isset($_GET['add_user'])){
                        $active="add_user";
                        include(TEMPLATE_BACK.DS."add_users.php");
                    };
                    if (isset($_GET['edit_user'])){
                        $active="edit_user";
                        include(TEMPLATE_BACK.DS."edit_users.php");
                    };
                    if (isset($_GET['report'])){
                        $active="report";
                        include(TEMPLATE_BACK.DS."report.php");
                    };
                    ?>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

        <?php include(TEMPLATE_BACK.DS."footer.php") ?>
