# COVID Data Analysis Project

This project involves analyzing COVID data, including vaccinations and deaths, using SQL queries and creating visualizations with Tableau.

## Table of Contents

1. [Jupyter Notebook: Adding Excel File to Database](#jupyter-notebook-adding-excel-file-to-database)
2. [Datasets](#datasets)
3. [SQL Queries](#sql-queries)
4. [Tableau Visualizations](#tableau-visualizations)

## Jupyter Notebook: Adding Excel File to Database

The Jupyter Notebook [Adding_Excelfile_to_Database.ipynb](Adding_Excelfile_to_Database.ipynb) demonstrates how to read COVID vaccination and death data from Excel files (`CovidVaccinations.xlsx` and `CovidDeaths.xlsx`) and add them to an SQLite database named `covid.db`.

## Datasets

- [CovidDeaths.xlsx](CovidDeaths.xlsx): Dataset containing COVID death information.
- [CovidVaccinations.xlsx](CovidVaccinations.xlsx): Dataset containing COVID vaccination information.

## SQL Queries

### Covid_data.sql

The SQL queries in [Covid_data.sql](Covid_data.sql) perform various analyses on COVID data, including:

- Showing different columns in the `CovidDeaths` table.
- Analyzing total cases vs total deaths for a specific location (e.g., Sweden).
- Examining the percentage of the population that got COVID in Sweden.
- Identifying countries with the highest infection rate compared to population.
- Determining countries with the highest death count per population.
- Analyzing death statistics by continent.

### Data Cleaning SQL Queries

[DataCleaningWithSQL/Housing_data_query.sql](Housing_data_query.sql) contains SQL queries for cleaning housing data.

## Tableau Dashboard Visualizations

Four tables extracted from Covid_data.sql have been saved as Excel files to facilitate the creation of a Tableau dashboard. These tables are instrumental in crafting an insightful visualization of COVID data trends.

You can access the Tableau xlsx files using the following links:

1. [Tableau project 1.xlsx](Tableau%20project%201.xlsx)
2. [Tableau project 2.xlsx](Tableau%20project%202.xlsx)
3. [Tableau project 3.xlsx](Tableau%20project%203.xlsx)
4. [Tableau project 4.xlsx](Tableau%20project%204.xlsx)


You find the final dashboard here: 
- Dashboard

Feel free to explore these Excel files to delve into the underlying data and code files for a comprehensive understanding of the project's various components.


