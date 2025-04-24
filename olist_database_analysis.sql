use olist;
-- 1. View all customers
select * from olist_sellers_dataset;
 
 -- 2. Waht is the total product height grouped by both product weight and length
 select product_weight_g,product_length_cm,sum(product_height_cm) as total_height
 from olist_products_dataset
 group by product_weight_g,product_length_cm
 order by total_height desc;
 
 -- 3. What are the lenghts of product names,photos,and descriptions for products that have a matching category translation
 -- (inner join)
 select product_name_length,product_photos_qty,product_description_length
 from olist_products_dataset
 inner join product_category_name_translation
 on  product_category_name_translation.product_category_name= olist_products_dataset.product_category_name;


 
 -- what are category translations are there,even if there is no matching product 
 -- (right join)
 select product_name_length,product_photos_qty,product_description_length
 from olist_products_dataset
 right join product_category_name_translation
 on  product_category_name_translation.product_category_name= olist_products_dataset.product_category_name
 where  olist_products_dataset.product_category_name is not null;
 
 -- 4.  Subquery
 select *
 from olist_products_dataset
 where product_category_name in (
        select product_category_name
        from product_category_name_translation
        );
        
        
        
-- Aggregate functions 
-- (SUM,AVG)
 select product_description_length,sum(product_length_cm) as total_score,round(avg(product_height_cm),1)as avg_height
 from olist_products_dataset 
 group by product_description_length;

select * from view_products_category_translation;

-- 5.Creating views for analysis
create view
view_products_category_translation as
select product_id,
       product_name_length,
       product_weight_g,
       product_length_cm,
       product_width_cm
from olist_products_dataset
inner join product_category_name_translation
on product_category_name_translation.product_category_name =  olist_products_dataset.product_category_name;

-- 6. optimize queries with indexes
create index
idx_product_category_name_english on
 product_category_name_translation
 (product_category_name_english)












       
     