CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
     DECLARE @master_start DATETIME, @master_end DATETIME;
     DECLARE @step_start DATETIME, @step_end DATETIME;
	BEGIN TRY
	    SET @master_start = GETDATE();
	    SET @step_start = GETDATE(); -- Fixed variable name
		PRINT 'Loading Bronze Layer'
		TRUNCATE TABLE bronze.crm_cust_info;
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\Tanish\sql\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH(
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			TABLOCK
		);
		SET @step_end = GETDATE(); 
		PRINT '   Completed in: ' + CAST(DATEDIFF(SECOND, @step_start, @step_end) AS NVARCHAR(10)) + ' seconds';

		TRUNCATE TABLE bronze.crm_prd_info;
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\Tanish\sql\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR= ',',
		TABLOCK
		);

		TRUNCATE TABLE bronze.crm_sales_details;
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\Tanish\sql\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH (
		   FIRSTROW = 2,
		   FIELDTERMINATOR = ',',
		   TABLOCK
		);

		TRUNCATE TABLE bronze.erp_loc_a101;
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\Tanish\sql\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK 
		);

		TRUNCATE TABLE bronze.erp_cust_az12;
		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Users\Tanish\sql\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		TRUNCATE TABLE bronze.erp_loc_a101;
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\Tanish\sql\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
	END TRY
	BEGIN CATCH
	    PRINT  'not today twin' + ERROR_MESSAGE();
	END CATCH
END
