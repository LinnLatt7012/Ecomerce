<div class="col-lg-12">
    <h1 class="page-header">
        Users

    </h1>
    <p class="bg-success">
        <?php // echo $message; 
       edit_user(); ?>
    </p>

<?php
    $query= query("SELECT * FROM users where user_id= " . escape_string($_GET['id']) . " ");
    confirm_q($query);
    while($row= fetch_array($query)):
    
?>
    <div class="col-md-12">

        
            <form action="" method="post" enctype="multipart/form-data">
                <table class="table table-hover">
                <div class="col-md-8" style="width: 1000px;  display: block;">
                    <div class="form-group" >
                        <label for="username"> USERNAME</label>
                        <input type="text" name="username" class="form-control"value="<?php echo $row['user_name'];?>" style="width: 200px;">
                    </div>
                </div>
                <div  style=" display: block;">
                    <div class="col-md-8" style="width: 300px;">
                        <label for="gmail">GMAIL</label>
                        <input type="text" name="gmail" class="form-control"value="<?php echo $row['email'];?>" style="width: 200px;">
                    </div>
                    <div class="col-md-4">
                        <label for="password"> Password </label>
                        <input type="text" name="password" class="form-control" value="<?php echo $row['password'];?>" style="width: 200px;">
                    </div>
                </div>
                
                </table>
                <div class="col-md-4" style="width: 350px; margin-left:180px;">
                    <div class="form-group">
                    <input type="submit" name="Edit_User" class="btn btn-primary btn-lg" value="Edit">
                    </div>
                </div>
            </form>
        
        <!--End of Table-->


    </div>

<?php
endwhile;
?>










</div>