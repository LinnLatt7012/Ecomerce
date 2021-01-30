<?php
require_once("../resource/config.php");
require_once( DIRE.DS."cart.php");
?>
<?php include(TEMPLATE_FRONT.DS."header.php") ?>

<?php
    process_transaction();
?>
    <!-- Page Content -->
    <div class="container">
        <h1 class="text-center">THANK YOU</h1>
    
    </div>
    <!-- /.container -->
<?php include(TEMPLATE_FRONT.DS."footer.php") ?>