# Movie Dataset Analysis README

## Overview

This README provides an overview of the analysis performed on a movie dataset using a Jupyter notebook (`Finding correlations.ipynb`). The notebook covers various aspects, including handling missing data, transforming data types, and exploring correlations within the dataset.

## Contents

1. [Handling Missing Data](#handling-missing-data)
2. [Changing Datatypes in Columns](#changing-datatypes-in-columns)
3. [Overwriting Columns](#overwriting-columns)
4. [Cleansing Data](#cleansing-data)
5. [Exploring Correlations](#exploring-correlations)

## Handling Missing Data

The notebook starts by identifying and handling missing data in the dataset. Two approaches are implemented: one involves using the KNN algorithm to handle missing values in the 'budget' column, while the other simply removes rows with missing data.

## Changing Datatypes in Columns

Data types of specific columns ('budget' and 'gross') are changed to `int64` for better compatibility and representation.

## Overwriting Columns

The 'year' column is updated by extracting the year from the 'released' column, addressing the mismatch between 'released' year and 'year'.

## Cleansing Data

Rows with problematic 'year' values (more than 4 characters) are eliminated, and duplicates are removed from the dataset.

## Exploring Correlations

### 1. Displaying Linear Correlation

A scatter plot and a seaborn regplot are used to visualize the linear correlation between budget and gross earnings.

### 2. Displaying Correlation Heatmap with Numerical Data

Correlation heatmaps are generated for the original dataset and the one with missing values handled using the KNN algorithm.

### 3. Transforming Object Data Types

Object data types are transformed into numerical values to prepare for further correlation analysis.

### 4. Visualizing the Transformed Data in Correlation Heatmaps

Correlation heatmaps are displayed after transforming object data types, providing insights into the relationships between numerical features.

## Conclusion

The analysis explores various aspects of the movie dataset, from handling missing data to examining correlations. The provided visualizations aid in understanding the relationships within the dataset.

Feel free to explore the Jupyter notebook for a more detailed analysis.
