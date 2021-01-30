CREATE TABLE `ecom_db`.`product` 
( `product_id` INT(11) NOT NULL AUTO_INCREMENT , 
`product_title` VARCHAR(255) NOT NULL , 
`product_category_id` INT(11) NOT NULL , 
`product_price` FLOAT(11) NOT NULL ,
`product_description` TEXT NOT NULL , 
`product_image` VARCHAR(256) NOT NULL , 
PRIMARY KEY (`product_id`)) ENGINE = InnoDB;

