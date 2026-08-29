Data Catalog for Gold Layer

Overview

The Gold layer contains business-ready data for analytics and reporting. It uses dimension and fact tables.

1. gold.dim_customers

Purpose: Stores customer information with demographic and geographic details.

Column

Data Type

Description

customer_key

INT

Surrogate key for the customer dimension.

customer_id

INT

Unique customer identifier.

customer_number

NVARCHAR(50)

Business/customer reference number.

first_name

NVARCHAR(50)

Customer first name.

last_name

NVARCHAR(50)

Customer last name.

country

NVARCHAR(50)

Customer country of residence.

marital_status

NVARCHAR(50)

Customer marital status.

gender

NVARCHAR(50)

Customer gender.

birthdate

DATE

Customer date of birth.

create_date

DATE

Date the customer record was created.

2. gold.dim_products

Purpose: Stores product information and product attributes.

Column

Data Type

Description

product_key

INT

Surrogate key for the product dimension.

product_id

INT

Unique product identifier.

product_number

NVARCHAR(50)

Business/product reference number.

product_name

NVARCHAR(50)

Name and description of the product.

category_id

NVARCHAR(50)

Product category identifier.

category

NVARCHAR(50)

Main product category.

subcategory

NVARCHAR(50)

Product subcategory.

maintenance_required

NVARCHAR(50)

Indicates whether maintenance is required.

cost

INT

Product cost.

product_line

NVARCHAR(50)

Product line or series.

start_date

DATE

Date the product became available.

3. gold.fact_sales

Purpose: Stores sales transactions for analysis.

Column

Data Type

Description

order_number

NVARCHAR(50)

Sales order identifier.

product_key

INT

Link to the product dimension.

customer_key

INT

Link to the customer dimension.

order_date

DATE

Date the order was placed.

shipping_date

DATE

Date the order was shipped.

due_date

DATE

Payment due date.

sales_amount

INT

Total sales amount for the line item.

quantity

INT

Number of units sold.

price

INT

Unit selling price.
