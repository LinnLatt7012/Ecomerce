<?php 
edit_product();
?>
<div class="col-md-12">

    <div class="row">
        <h1 class="page-header">
            Edit Product
        </h1>
    </div>
    <?php
    $query= query("SELECT * FROM product where product_id= " . escape_string($_GET['id']) . " ");
    confirm_q($query);
    while($row= fetch_array($query)):
    
?>
    

    <form action="" method="post" enctype="multipart/form-data">


        <div class="col-md-8">

            <div class="form-group">
                <label for="product-title">Product Title </label>
                <input type="text" name="product_title" class="form-control" value="<?php echo $row['product_title'];?>">

            </div>


            <div class="form-group">
                <label for="product_description">Product Description</label>
                <textarea name="product_description" id="" cols="30" rows="10" class="form-control" ><?php echo $row['product_description'];?></textarea>
            </div>



            <div class="form-group row">

                <div class="col-xs-3">
                    <label for="product-price">Product Price</label>
                    <input type="number" name="product_price" step="0.001" class="form-control" value="<?php echo $row['product_price'];?>" size="60">
                </div>
            </div>







        </div>
        <!--Main Content-->


        <!-- SIDEBAR-->


        <aside id="admin_sidebar" class="col-md-4">


            <div class="form-group">
                <input type="submit" name="draft" class="btn btn-warning btn-lg" value="Draft">
                <input type="submit" name="edit" class="btn btn-primary btn-lg" value="Edit">
            </div>


            <!-- Product Categories-->

            <div class="form-group">
                <label for="product_category">Product Category</label>
                <hr>
                <select name="product_category" id="" class="form-control" value="<?php echo $row['product_category_id'];?>" >
                    <!-- <option value="">Select Category</option> -->
                    <?php display_option($row['product_category_id']); ?>
                </select>


            </div>





            <!-- Product Brands-->


            <div class="form-group">
                <label for="product-title">Product Qunatity</label>
                    <input type="number" name="product_quantity" class="form-control" size="60" value="<?php echo $row['product_quantity'];?>">
                </select>
            </div>


            <!-- Product Tags -->


            <div class="form-group">
                <label for="product_short_desc">Product Short Descrption</label>
                <hr>
                <input type="text" name="product_short_desc" class="form-control" value="<?php echo $row['short_desc'];?>">
            </div>

            <!-- Product Image -->
            <div class="form-group">
                <label for="product-title">Product Image</label>
                <input type="file" name="file" >
                <br>
                your photo have to be rechoosen for every change.
                <?php echo'<img src="../../resource/uploads/'.$row["product_image"].'"  width="310px">';?>
            </div>

<?php
endwhile;
?>

        </aside>
        <!--SIDEBAR-->



    </form>