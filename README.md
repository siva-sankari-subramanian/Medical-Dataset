# Data Warehousing and Analytical project - Using Medical Dataset

This project is to demonstrate Data warehousing process along with analytical solution for a medical dataset. The aim is to design a project which can closely align with industry practice and showcase my level of knowledge in this area


-----
## Objective:

This project aims to showcase the design and implementation of a data warehousing solution with an analytical layer, focusing on medical data. The goal is to align the project closely with industry practices, demonstrating knowledge of data warehousing concepts, ETL processes, and reporting solutions.

## About the Dataset:

I have utilized a synthetic medical dataset designed for hospital data warehousing. While the data is not real-world hospital data, it simulates key aspects typically found in such environments and is suitable for showcasing data warehousing processes.

***Source:*** Synthetic Medical Dataset on Kaggle: https://www.kaggle.com/datasets/mebrar21/medsynora-dw

***Dataset Details:*** The dataset contains over 20 tables that are pre-cleaned and categorized into fact, dimension, and bridge tables. This enables us to focus on designing the data model and implementing an ETL pipeline, rather than spending time on data cleaning.

## Approach & Data Architecture:

Although I initially aimed to implement a Medallion Architecture (with three layers), I adapted my approach to focus on a two-layer architecture due to the nature of the provided dataset, which was already cleaned and organized. This structure reflects a simplified but effective version of a typical data warehouse.

## 1. Staging Layer (Development/Dev)

The first layer is the staging area where the raw data (in CSV format) is extracted, loaded, and temporarily stored in the database.

***ETL Process:*** Extract the CSV files and load them into a staging schema.

***Purpose:*** This layer serves as a temporary storage area to validate the data before transforming it into a more usable form.

## 2. Data Mart Layer (Production/Prod)

The second layer is the data mart, where the data is transformed into a structure suitable for business intelligence (BI) purposes such as reporting and analysis.

***Transformation:*** In this layer, the data is transformed to create useful aggregates and summaries for business use. This includes tasks like creating fact tables, dimension tables, and ensuring data integrity.

***Purpose:*** The data mart enables reporting, dashboards, and other BI tools to perform analysis on the dataset.

<img width="783" height="334" alt="dataflow drawio" src="./assets/Dataworkflow.drawio.png" />



## Star Schema:

I've designed and implemented a star schema data model to organize the dataset effectively. This structure enables more efficient reporting and querying by simplifying relationships, improving query performance, and ensuring that the data is easy to navigate. The model is optimized for generating insightful reports and supporting business intelligence needs.

I have categorized the datasets into 4 different categories:

**1. Fact Tables:** Encounter

**2. Dimension Tables:** Patient,Doctor,Disease,Insurance,Room,Date,ChronicDisease,Allergy,AdditionalService

**3. Satelite Tables:** LabTest,Vitals,SpecialTest,Treatment,Cost,TreatmentCost

**4. Bridge Tables:** Patient_ChronicDisease,Patient_Allergy,Encounter_AdditionalService,Patient_AdditionalService,Encounter_Doctor


<img width="1225" height="492" alt="STAR SCHEMA_Final" src="./assets/STAR SCHEMA_Final.png" />
