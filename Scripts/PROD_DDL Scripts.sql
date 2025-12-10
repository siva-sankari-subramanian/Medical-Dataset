/*
===============================================================================
DDL Script: Create prod Tables
===============================================================================
Script Purpose: This script creates tables in the 'prod' schema
===============================================================================
*/

IF OBJECT_ID('prod.Patient', 'U') IS NOT NULL
    DROP TABLE prod.Patient;
GO
CREATE TABLE prod.Patient(
Patient_ID NVARCHAR(50),
Patient_Name NVARCHAR(50),
Gender NVARCHAR(50),
Birth_Date DATE,
Height INT,
Weight INT,
Marital_Status NVARCHAR(50),
Nationality NVARCHAR(50),
Blood_Type NVARCHAR(50)
)
GO

IF OBJECT_ID('prod.Doctor', 'U') IS NOT NULL
    DROP TABLE prod.Doctor;
GO
CREATE TABLE prod.Doctor(
Doctor_ID INT,
Doctor_Name NVARCHAR(50), 
Doctor_Title NVARCHAR(50),
Doctor_Nationality NVARCHAR(50),
Medical_Unit NVARCHAR(50),
Max_Patient_Count INT
)
GO

IF OBJECT_ID('prod.Disease', 'U') IS NOT NULL
    DROP TABLE prod.Disease;
GO
CREATE TABLE prod.Disease(
Disease_ID INT,
Admission_Diagnosis NVARCHAR(50),
Disease_Type NVARCHAR(50),
Disease_Severity NVARCHAR(50),
Medical_Unit NVARCHAR(50)
)
GO

IF OBJECT_ID('prod.Date', 'U') IS NOT NULL
    DROP TABLE prod.Date;
GO
CREATE TABLE prod.Date(
Date DATE,
DateKey INT,
Year INT,
Month INT,
Day INT,
Quarter INT,
Weekday INT,
Date_String NVARCHAR(50)
)
GO

IF OBJECT_ID('prod.Insurance', 'U') IS NOT NULL
    DROP TABLE prod.Insurance
GO

CREATE TABLE prod.Insurance(
InsuranceKey INT,
Insurance_Plan_Name NVARCHAR(50),
Coverage_Limit FLOAT,
Deductible INT,
Excluded_Treatments NVARCHAR(500),
Partial_Coverage_Treatments NVARCHAR(500)
)
GO

IF OBJECT_ID('prod.Room', 'U') IS NOT NULL
    DROP TABLE prod.Room;
GO

CREATE TABLE prod.Room(
RoomKey INT,
Care_Level NVARCHAR(50),
Room_Type NVARCHAR(50)
)
GO 

IF OBJECT_ID('prod.ChronicDisease', 'U') IS NOT NULL
    DROP TABLE prod.ChronicDisease;
GO
CREATE TABLE prod.ChronicDisease(
ChronicDiseaseID INT,
ChronicDiseaseName NVARCHAR(50)
)
GO

IF OBJECT_ID('prod.Allergy', 'U') IS NOT NULL
    DROP TABLE prod.Allergy;
GO
CREATE TABLE prod.Allergy(
AllergyID INT,
AllergyName NVARCHAR(50)
)
GO 

IF OBJECT_ID('prod.AdditionalService', 'U') IS NOT NULL
    DROP TABLE prod.AdditionalService;
GO

CREATE TABLE prod.AdditionalService(
AdditionalServiceID INT,
ServiceName NVARCHAR(50)
)
GO

IF OBJECT_ID('prod.SpecialTest', 'U') IS NOT NULL
    DROP TABLE prod.SpecialTest;
GO


CREATE TABLE prod.SpecialTest(
Encounter_ID INT,
Test_ID INT,
Test_Phase NVARCHAR(50),
Test_Name NVARCHAR(50),
Test_Result FLOAT
)
GO

IF OBJECT_ID('prod.Treatment', 'U') IS NOT NULL
    DROP TABLE prod.Treatment;
GO

CREATE TABLE prod.Treatment(
Encounter_ID INT,
Treatment_ID INT,
Treatment_Type NVARCHAR(50),
Treatment_Name NVARCHAR(50),
Follow_Up NVARCHAR(50),
Complications NVARCHAR(50),
Drug_Boxes_Used INT,
Therapy_Sessions INT
)
GO

IF OBJECT_ID('prod.Patient_AdditionalService', 'U') IS NOT NULL
    DROP TABLE prod.Patient_AdditionalService;
GO

CREATE TABLE prod.Patient_AdditionalService(
Encounter_ID INT,
AdditionalServiceID INT

)
GO

IF OBJECT_ID('prod.Patient_Allergy') IS NOT NULL
    DROP TABLE prod.Patient_Allergy
GO

CREATE TABLE prod.Patient_Allergy(
Patient_ID NVARCHAR(50),
AllergyID INT
)
GO

IF OBJECT_ID('prod.Patient_ChronicDisease') IS NOT NULL
    DROP TABLE prod.Patient_ChronicDisease
GO

CREATE TABLE prod.Patient_ChronicDisease(
Patient_ID INT,
ChronicDiseaseID INT
)
GO

IF OBJECT_ID('prod.Cost') IS NOT NULL
    DROP TABLE prod.Cost
GO

CREATE TABLE prod.Cost(
Encounter_ID INT,
CostType NVARCHAR(50),
CostAmount FLOAT
)
GO

IF OBJECT_ID('prod.Encounter') IS NOT NULL
    DROP TABLE prod.Encounter
GO

CREATE TABLE prod.Encounter(
Encounter_ID INT,
Patient_ID NVARCHAR(50),
Disease_ID INT,
ResponsibleDoctorID INT,
InsuranceKey INT,
RoomKey INT,
CheckinDate DATE,
CheckoutDate DATE,
CheckinDateKey INT,
CheckoutDateKey INT,
Patient_Severity_Score FLOAT,
RadiologyType NVARCHAR(50),
RadiologyProcedureCount INT,
EndoscopyType NVARCHAR(50),
EndoscopyProcedureCount INT,
CompanionPresent NVARCHAR(50) 
)
GO


IF OBJECT_ID('prod.LabTest') IS NOT NULL
    DROP TABLE prod.LabTest
GO

CREATE TABLE prod.LabTest(
Encounter_ID INT,
Patient_ID NVARCHAR(50),
Phase NVARCHAR(50),
LabType NVARCHAR(50),
TestName NVARCHAR(50),
TestValue FLOAT
)
GO


IF OBJECT_ID('prod.TreatmentCost') IS NOT NULL
    DROP TABLE prod.TreatmentCost
GO

CREATE TABLE prod.TreatmentCost(
Encounter_ID INT,
Treatment_ID INT,
Drug_Cost INT,
Surgery_Cost INT,
Post_Surgery_Care_Cost INT,
Education_Rehab_Cost INT,
Hospital_Drug_Quantity INT,
Discharge_Drug_Quantity INT,
Total_Drug_Quantity INT
)
GO


IF OBJECT_ID('prod.Vitals') IS NOT NULL
    DROP TABLE prod.Vitals
GO

CREATE TABLE prod.Vitals(
Encounter_ID INT,
Patient_ID NVARCHAR(50),
Phase NVARCHAR(50),
HeartRate FLOAT,
Temperature FLOAT,
SystolicBP INT,
DiastolicBP INT,
RespRate INT,
O2Sat FLOAT
)
GO


IF OBJECT_ID('prod.Encounter_AdditionalService') IS NOT NULL
    DROP TABLE prod.Encounter_AdditionalService
GO

CREATE TABLE prod.Encounter_AdditionalService(
Encounter_ID INT,
AdditionalServiceID INT
)
GO

IF OBJECT_ID('prod.Encounter_Doctor') IS NOT NULL
    DROP TABLE prod.Encounter_Doctor
GO

CREATE TABLE prod.Encounter_Doctor(
Encounter_ID INT,
Doctor_ID INT
)
GO


