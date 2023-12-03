# Nashville Housing Data Cleaning Project

This project involves cleaning housing data using SQL queries. It covers various tasks such as standardizing date formats, checking and filling null values, breaking down addresses, and more.

## Table of Contents

- [Documents](#documents)
- [Getting Started](#getting-started)
- [Data Cleaning Steps](#data-cleaning-steps)
- [Adding Excel File to Database](#adding-excel-file-to-database)
- [Database](#database)

## Documents

1. [Data Cleaning SQL Queries](Housing_data_query.sql)
2. [Adding Excel File to Database - Jupyter Notebook](Adding_Excelfile_to_Database.ipynb)
3. [Database File](Housingdata.db)
4. [Excel Data Source](NashvilleHousingDataforDataCleaning.xlsx)

## Getting Started

To get started with this project, you'll need to follow these steps:

1. Clone the repository to your local machine.
2. Make sure you have an SQLite database set up (refer to [Database](#database)).
3. Open and execute the SQL queries in [Data Cleaning SQL Queries](Housing_data_query.sql) on your SQLite database.

## Data Cleaning Steps

The SQL queries in [Housing_data_query.sql](Housing_data_query.sql) perform the following tasks:

- Standardizing date formats
- Checking and filling null values in PropertyAddress
- Counting distinct ParcelID values for each PropertyAddress
- Checking for distinct PropertyAddress values for each ParcelID
- Populating null PropertyAddress data based on ParcelID
- Breaking out Address into individual columns (Address, City, State)
- Extracting and transforming OwnerAddress information to separate columns
- Changing 'Y' and 'N' to 'Yes' and 'No' in the "Sold as Vacant" field
- Removing duplicate rows
- Removing unnecessary columns from the dataset

## Adding Excel File to Database

The Jupyter Notebook [Adding_Excelfile_to_Database.ipynb](Adding_Excelfile_to_Database.ipynb) demonstrates how to read an Excel file and add its contents to an SQLite database.

## Database

The SQLite database file [Housingdata.db](Housingdata.db) is used to store the cleaned housing data.

**Note:** The SQLite database file should be created and ready before executing the SQL queries.

