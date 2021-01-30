<h3 class="text-center bg-warning"> <?php display_msg();?></h3>
<div class="col-md-12">
    <div class="row">
        <h1 class="page-header">
            All Orders

        </h1>
    </div>

    <div class="row">
        <table class="table table-hover">
            <thead>

                <tr>
                    <th>S.N</th>
                    <th>Order_date</th>
                    <th>Total Amount</th>
                    <th>Invoice Number</th>
                    <th>Status</th>
                    <th>Currency</th>
                </tr>
            </thead>
            <tbody>
                <?php display_orders(); ?>
            </tbody>
        </table>
    </div>