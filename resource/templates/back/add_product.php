<?php add_product(); 
   // echo '<img src="" alt="" class="product_image">';
  // display_msg();
?>
<div class="col-md-12">

    <div class="row">
        <h1 class="page-header">
            Add Product

        </h1>
    </div>

    

    <form action="" method="post" enctype="multipart/form-data">


        <div class="col-md-8">

            <div class="form-group">
                <label for="product-title">Product Title </label>
                <input type="text" name="product_title" class="form-control">

            </div>


            <div class="form-group">
                <label for="product_description">Product Description</label>
                <textarea name="product_description" id="" cols="30" rows="10" class="form-control"></textarea>
            </div>



            <div class="form-group row">

                <div class="col-xs-3">
                    <label for="product-price">Product Price</label>
                    <input type="number" name="product_price" step="0.001" class="form-control" size="60">
                </div>
            </div>







        </div>
        <!--Main Content-->


        <!-- SIDEBAR-->


        <aside id="admin_sidebar" class="col-md-4">


            <div class="form-group">
                <input type="submit" name="draft" class="btn btn-warning btn-lg" value="Draft">
                <input type="submit" name="publish" class="btn btn-primary btn-lg" value="Publish">
            </div>


            <!-- Product Categories-->

            <div class="form-group">
                <label for="product_category">Product Category</label>
                <hr>
                <select name="product_category" id="" class="form-control">
                    <!-- <option value="">Select Category</option> -->
                    <?php display_option(1); ?>
                </select>


            </div>





            <!-- Product Brands-->


            <div class="form-group">
                <label for="product-title">Product Qunatity</label>
                    <input type="number" name="product_quantity" class="form-control" size="60">
                </select>
            </div>


            <!-- Product Tags -->


            <div class="form-group">
                <label for="product_short_desc">Product Short Descrption</label>
                <hr>
                <input type="text" name="product_short_desc" class="form-control">
            </div>

            <!-- Product Image -->
            <div class="form-group">
                <label for="product-title">Product Image</label>
                <input type="file" name="file">

            </div>



        </aside>
        <!--SIDEBAR-->



    </form>