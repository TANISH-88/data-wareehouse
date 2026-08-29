# Data Catalog

## Overview

The Gold layer contains business-ready data for analytics and reporting.

## gold.dim_customers

Stores customer information.

| Column | Data Type | Description |
|---|---|---|
| customer_key | INT | Surrogate key for the customer |
| customer_id | INT | Unique customer identifier |
| customer_number | NVARCHAR(50) | Customer reference number |
| first_name | NVARCHAR(50) | Customer first name |
| last_name | NVARCHAR(50) | Customer last name |
| country | NVARCHAR(50) | Customer country |
| marital_status | NVARCHAR(50) | Customer marital status |
| gender | NVARCHAR(50) | Customer gender |
| birthdate | DATE | Customer date of birth |
| create_date | DATE | Customer record creation date |

## gold.dim_products

Stores product information.

| Column | Data Type | Description |
|---|---|---|
| product_key | INT | Surrogate key for the product |
| product_id | INT | Unique product identifier |
| product_number | NVARCHAR(50) | Product reference number |
| product_name | NVARCHAR(50) | Product name |
| category_id | NVARCHAR(50) | Product category identifier |
| category | NVARCHAR(50) | Product category |
| subcategory | NVARCHAR(50) | Product subcategory |
| maintenance_required | NVARCHAR(50) | Indicates whether maintenance is required |
| cost | INT | Product cost |
| product_line | NVARCHAR(50) | Product line |
| start_date | DATE | Product start date |

## gold.fact_sales

Stores sales transactions.

| Column | Data Type | Description |
|---|---|---|
| order_number | NVARCHAR(50) | Sales order identifier |
| product_key | INT | Link to dim_products |
| customer_key | INT | Link to dim_customers |
| order_date | DATE | Order date |
| shipping_date | DATE | Shipping date |
| due_date | DATE | Payment due date |
| sales_amount | INT | Total sales amount |
| quantity | INT | Quantity sold |
| price | INT | Unit selling price |
