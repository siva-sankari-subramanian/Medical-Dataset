/*
===============================================================================
Stored Procedure: Load prod Layer (Source -> prod)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'prod' schema from external CSV files. 
    It performs the following actions:
    - Truncates the prod tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to prod tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.


To Execute:
 
--EXEC prod.load_prod

===============================================================================
*/
CREATE OR ALTER PROCEDURE prod.load_prod AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME; 
	BEGIN TRY 
		SET @batch_start_time = GETDATE();
		PRINT '================================================';
		PRINT 'Loading prod Layer';
		PRINT '================================================';


		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: prod.AdditionalService';
		TRUNCATE TABLE prod.AdditionalService;
		PRINT '>> Inserting Data Into: prod.AdditionalService';
		INSERT INTO prod.AdditionalService(
			AdditionalServiceID,
			ServiceName
		)
		SELECT * FROM dev.AdditionalService
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

        SET @start_time = GETDATE();
		PRINT '>> Truncating Table: prod.Allergy';
		TRUNCATE TABLE prod.Allergy;
		PRINT '>> Inserting Data Into: prod.Allergy';
		INSERT INTO prod.Allergy(
			AllergyID,
			AllergyName
		)
		SELECT * FROM dev.Allergy
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

        SET @start_time = GETDATE();
		PRINT '>> Truncating Table: prod.ChronicDisease';
		TRUNCATE TABLE prod.ChronicDisease;
		PRINT '>> Inserting Data Into: prod.ChronicDisease';
		INSERT INTO prod.ChronicDisease(
			ChronicDiseaseID,
			ChronicDiseaseName
		)
		SELECT * FROM dev.ChronicDisease
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: prod.Date';
		TRUNCATE TABLE prod.Date;
		PRINT '>> Inserting Data Into: prod.Date';
		INSERT INTO prod.Date(
			Date,
			DateKey,
			Year,
			Month,
			Day,
			Quarter,
			Weekday,
			Date_String
		)
		SELECT * FROM dev.Date
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: prod.Disease';
		TRUNCATE TABLE prod.Disease;
		PRINT '>> Inserting Data Into: prod.Disease';
		INSERT INTO prod.Disease(
			Disease_ID,
			Admission_Diagnosis,
			Disease_Type,
			Disease_Severity,
			Medical_Unit
			)
		SELECT * FROM dev.Disease
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: prod.Doctor';
		TRUNCATE TABLE prod.Doctor;
		PRINT '>> Inserting Data Into: prod.Doctor';
		INSERT INTO prod.Doctor(
			Doctor_ID,
			Doctor_Name,
			Doctor_Title,
			Doctor_Nationality,
			Medical_Unit,
			Max_Patient_Count
			)
		SELECT 
			Doctor_ID,
			CONCAT(Doctor_Name,' ',Doctor_Surname) AS Doctor_Name,
			Doctor_Title,
			Doctor_Nationality,
			Medical_Unit,
			Max_Patient_Count 
		FROM dev.Doctor
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: prod.Patient';
		TRUNCATE TABLE prod.Patient;
		PRINT '>> Inserting Data Into: prod.Patient';
		INSERT INTO prod.Patient(
			Patient_ID,
			Patient_Name,
			Gender,
			Birth_Date,
			Height,
			Weight,
			Marital_Status,
			Nationality,
			Blood_Type
			)
		SELECT 
			Patient_ID,
			CONCAT(First_Name,' ',Last_Name) AS Patient_Name,
			Gender,
			Birth_Date,
			Height,
			Weight,
			Marital_Status,
			Nationality,
			Blood_Type 
		FROM dev.Patient
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: prod.Room';
		TRUNCATE TABLE prod.Room;
		PRINT '>> Inserting Data Into: prod.Room';
		INSERT INTO prod.Room(
			RoomKey,
			Care_Level,
			Room_Type
			)
		SELECT * FROM dev.Room
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: prod.SpecialTest';
		TRUNCATE TABLE prod.SpecialTest;
		PRINT '>> Inserting Data Into: prod.SpecialTest';
		INSERT INTO prod.SpecialTest(
			Encounter_ID,
			Test_ID,
			Test_Phase,
			Test_Name,
			Test_Result 
			)
		SELECT * FROM dev.SpecialTest
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';
		
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: prod.Treatment';
		TRUNCATE TABLE prod.Treatment;
		PRINT '>> Inserting Data Into: prod.Treatment';
		INSERT INTO prod.Treatment(
			Encounter_ID,
			Treatment_ID,
			Treatment_Type,
			Treatment_Name,
			Follow_Up,
			Complications,
			Drug_Boxes_Used,
			Therapy_Sessions
			)
		SELECT * FROM dev.Treatment
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';


		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: prod.Insurance';
		TRUNCATE TABLE prod.Insurance;
		PRINT '>> Inserting Data Into: prod.Insurance';
		INSERT INTO prod.Insurance(
			InsuranceKey,
			Insurance_Plan_Name,
			Coverage_Limit,
			Deductible,
			Excluded_Treatments,
			Partial_Coverage_Treatments
			)
		SELECT * FROM dev.Insurance
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------'

		
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: prod.Cost';
		TRUNCATE TABLE prod.Cost;
		PRINT '>> Inserting Data Into: prod.Cost';
		INSERT INTO prod.Cost(
			Encounter_ID,
			CostType,
			CostAmount
			)
		SELECT * FROM dev.Cost
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------'

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: prod.Encounter';
		TRUNCATE TABLE prod.Encounter;
		PRINT '>> Inserting Data Into: prod.Encounter';
		INSERT INTO prod.Encounter(
			Encounter_ID,
			Patient_ID,
			Disease_ID,
			ResponsibleDoctorID,
			InsuranceKey,
			RoomKey,
			CheckinDate,
			CheckoutDate,
			CheckinDateKey,
			CheckoutDateKey,
			Patient_Severity_Score,
			RadiologyType,
			RadiologyProcedureCount,
			EndoscopyType,
			EndoscopyProcedureCount,
			CompanionPresent 
			)
		SELECT * FROM dev.Encounter
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------'

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: prod.LabTest';
		TRUNCATE TABLE prod.LabTest;
		PRINT '>> Inserting Data Into: prod.LabTest';
		INSERT INTO prod.LabTest(
			Encounter_ID,
			Patient_ID,
			Phase,
			LabType,
			TestName,
			TestValue
			)
		SELECT * FROM dev.LabTest
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------'

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: prod.TreatmentCost';
		TRUNCATE TABLE prod.TreatmentCost;
		PRINT '>> Inserting Data Into: prod.TreatmentCost';
		INSERT INTO prod.TreatmentCost(
			Encounter_ID,
			Treatment_ID,
			Drug_Cost,
			Surgery_Cost,
			Post_Surgery_Care_Cost,
			Education_Rehab_Cost,
			Hospital_Drug_Quantity,
			Discharge_Drug_Quantity,
			Total_Drug_Quantity
			)
		SELECT * FROM dev.TreatmentCost
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------'


		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: prod.Vitals';
		TRUNCATE TABLE prod.Vitals;
		PRINT '>> Inserting Data Into: prod.Vitals';
		INSERT INTO prod.Vitals(
			Encounter_ID,
			Patient_ID,
			Phase,
			HeartRate,
			Temperature,
			SystolicBP,
			DiastolicBP,
			RespRate,
			O2Sat
			)
		SELECT * FROM dev.Vitals
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------'

		
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: prod.Patient_AdditionalService';
		TRUNCATE TABLE prod.Patient_AdditionalService;
		PRINT '>> Inserting Data Into: prod.Patient_AdditionalService';
		INSERT INTO prod.Patient_AdditionalService(
			Encounter_ID,
			AdditionalServiceID
			)
		SELECT * FROM dev.Patient_AdditionalService;
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------'

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: prod.Patient_Allergy';
		TRUNCATE TABLE prod.Patient_Allergy;
		PRINT '>> Inserting Data Into: prod.Patient_Allergy';
		INSERT INTO prod.Patient_Allergy(
			Patient_ID,
			AllergyID
			)
		SELECT * FROM dev.Patient_Allergy;
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------'

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: prod.Patient_ChronicDisease';
		TRUNCATE TABLE prod.Patient_ChronicDisease;
		PRINT '>> Inserting Data Into: prod.Patient_ChronicDisease';
		INSERT INTO prod.Patient_ChronicDisease(
			Patient_ID,
			ChronicDiseaseID
			)
		SELECT * FROM dev.Patient_ChronicDisease;
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------'

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: prod.Encounter_AdditionalService';
		TRUNCATE TABLE prod.Encounter_AdditionalService;
		PRINT '>> Inserting Data Into: prod.Encounter_AdditionalService';
		INSERT INTO prod.Encounter_AdditionalService(
			Encounter_ID,
			AdditionalServiceID 
			)
		SELECT * FROM dev.Encounter_AdditionalService;
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------'


		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: prod.Encounter_Doctor';
		TRUNCATE TABLE prod.Encounter_Doctor;
		PRINT '>> Inserting Data Into: prod.Encounter_Doctor';
		INSERT INTO prod.Encounter_Doctor(
			Encounter_ID,
			Doctor_ID
			)
		SELECT * FROM dev.Encounter_Doctor;
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------'

	END TRY

	BEGIN CATCH
		PRINT '=========================================='
		PRINT 'ERROR OCCURED DURING LOADING prod LAYER'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '=========================================='
	END CATCH
	
END

--EXEC prod.load_prod