# Movie Dataset Analysis README

## Overview

This README offers an overview of the analysis conducted on a movie dataset using a Jupyter notebook (`Finding correlations.ipynb`). The notebook delves into different facets, encompassing tasks such as handling missing data, transforming data types, and exploring correlations within the dataset.

## Contents

1. [Handling Missing Data](#handling-missing-data)
2. [Changing Datatypes in Columns](#changing-datatypes-in-columns)
3. [Overwriting Columns](#overwriting-columns)
4. [Cleansing Data](#cleansing-data)
5. [Exploring Correlations](#exploring-correlations)

## Handling Missing Data

The notebook initiates by identifying and addressing missing data in the dataset. Two distinct approaches are employed: one utilizes the KNN algorithm to handle missing values in the 'budget' column, while the other straightforwardly removes rows with missing data.

## Changing Datatypes in Columns

Data types of specific columns ('budget' and 'gross') undergo conversion to int64 for enhanced compatibility and representation.

## Overwriting Columns

The 'year' column undergoes an update by extracting the year from the 'released' column, rectifying the mismatch between 'released' year and 'year'.

## Cleansing Data

Rows with problematic 'year' values (more than 4 characters) get eliminated, and duplicates are expunged from the dataset.

## Exploring Correlations

1. Displaying Linear Correlation

- A scatter plot and a seaborn regplot are employed to visualize the linear correlation between budget and gross earnings.

2. Displaying Correlation Heatmap with Numerical Data

- Correlation heatmaps are generated for the original dataset and the one with missing values handled using the KNN algorithm.

3. Transforming Object Data Types

- Object data types undergo transformation into numerical values to prepare for further correlation analysis.

4. Visualizing the Transformed Data in Correlation Heatmaps

- Correlation heatmaps are showcased post the transformation of object data types, offering insights into the relationships between numerical features.

## Conclusion

This analysis delves into various aspects of the movie dataset, ranging from handling missing data to scrutinizing correlations. The visualizations provided aid in comprehending the relationships within the dataset.

Feel free to explore the Jupyter notebook for an in-depth analysis.
