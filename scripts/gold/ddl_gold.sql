
if  object_id('gold.dim_customer','V') is not null
     drop view gold.dim_customer;
go
create view gold.dim_customer as
select 
     row_number() over (order by cst_id) as customer_key,
	ci.cst_id AS customer_id,
	ci.cst_key as customer_number,
	ci.cst_firstname AS first_name,
	ci.cst_lastname AS last_name,
	la.cntry as county,
	ci.cst_material_status AS marital_status,
	CASE WHEN ci.cst_gndr != 'n/a' THEN ci.cst_gndr --
		ELSE COALESCE(ca.gen, 'n/a')
	END AS gender,
	ca.bdate as birthdate,
	ci.cst_create_date as create_date
from silver.crm_cust_info ci
left join silver.erp_cust_az12 ca
on ci.cst_key=ca.cid
left join silver.erp_loc_a101 la
on ci.cst_key=la.cid


if  object_id('gold.dim_product','V') is not null
     drop view gold.dim_product;
go

create view gold.dim_product as
SELECT
    ROW_NUMBER() over (order by pn.prd_start_dt,pn.prd_key) as product_key,
    pn.prd_id AS product_id,
    pn.prd_key AS product_number,
    pn.prd_nm AS product_name,
    pn.cat_id AS category_id,
    pc.cat AS category,
    pc.subcat AS subcategory,
    pc.maintenance,
    pn.prd_cost AS cost,
    pn.prd_line AS product_line,
    pn.prd_start_dt AS start_date
FROM silver.crm_prd_info pn
LEFT JOIN silver.erp_px_cat_g1v2 pc
ON pn.cat_id = pc.id
WHERE prd_end_dt IS NULL --Filter o




if  object_id('gold.fact_sales','V') is not null
     drop view gold.fact_sales;
go
create view gold.fact_sales as
SELECT
sd.sls_ord_num AS order_number,
pr.product_key,
cu.customer_key,
sd.sls_order_dt AS order_date,
sd.sls_ship_dt AS shipping_date,
sd.sls_due_dt AS due_date,
sd.sls_sales AS sales_amount,
sd.sls_quantity AS quanity,
sd.sls_price price
FROM silver.crm_sales_details sd
LEFT JOIN gold.dim_product pr
ON sd.sls_prd_key = pr.product_number
LEFT JOIN gold.dim_customer cu
ON sd.sls_cust_id = cu.customer_id
