# Telco Customer Churn Prediction Project

## Overview

This project focuses on predicting customer churn in a telecommunications company using machine learning techniques. The primary goal is to develop models that can identify customers likely to churn, enabling the company to take proactive measures to retain them. Dataset: [nbi_data_set.xlsx](#nbi-data-setxlsx)


## Table of Contents

- [Introduction](#introduction)
- [Dataset](#dataset)
- [Exploratory Data Analysis (EDA)](#exploratory-data-analysis-eda)
- [Data Preprocessing](#data-preprocessing)
- [Machine Learning Models](#machine-learning-models)
  - [Artificial Neural Networks (ANN)](#artificial-neural-networks-ann)
  - [Logistic Regression](#logistic-regression)
  - [Gaussian Naive Bayes](#gaussian-naive-bayes)
- [Evaluation](#evaluation)
- [Conclusion](#conclusion)
- [Contributing](#contributing)

---

## Introduction

This project aims to predict customer churn in a telecommunications company by leveraging machine learning models. The dataset used in this project contains information about customers, including features such as monthly charges, contract details, and customer tenure.

## Dataset

The dataset used in this project consists of 5374 rows and 21 columns. The data includes both numerical and categorical features, and the target variable is "Churn," indicating whether a customer has churned or not.

## Exploratory Data Analysis (EDA)

The exploratory data analysis phase involves understanding the dataset, identifying patterns, and visualizing relationships between variables. Some key findings from the EDA include:

- The dataset has 5374 rows and 21 columns.
- There are 200 instances of churn in the dataset.
- Columns such as "TotalCharges" contain null values, which are handled appropriately.

## Data Preprocessing

Data preprocessing is a crucial step to prepare the data for machine learning models. This includes handling missing values, converting categorical variables into numerical formats, and scaling features. The preprocessing steps involve:

- Deleting the "customerID" column.
- Dropping rows with null values.
- Converting categorical variables to numerical using label encoding.
- Scaling values in columns where needed, using Min-Max scaling.

## Machine Learning Models

### Artificial Neural Networks (ANN)

An Artificial Neural Network model is implemented with 26 input nodes, two hidden layers, and an output layer. Two variations of the model are trained: one using Smote upsampling with scaling and one without scaling.

### Logistic Regression

Logistic Regression models are built using the Smote sampling method. Two variations are trained: one with scaling and one without scaling.

### Gaussian Naive Bayes

Gaussian Naive Bayes models are implemented using Smote sampling. Similar to Logistic Regression, two variations are trained: one with scaling and one without scaling.

## Evaluation

The performance of each model is evaluated based on metrics such as accuracy, precision, recall, and F1 score. The classification reports for each model are presented, highlighting key metrics for predicting customer churn.

## Conclusion

Despite various attempts to improve model performance, the project faced challenges in achieving high F1 scores. Further exploration and experimentation may be necessary to enhance the predictive capabilities of the models.

## Contributing

If you would like to contribute to this project, feel free to submit pull requests or open issues.

---

## nbi_data_set.xlsx

### Overview

The "nbi_data_set.xlsx" document contains additional information or data relevant to the project. Please refer to this document for specific details on the dataset, data sources, or any other supplementary information.

### Contents

- [Description of Data](#description-of-data)
- [Data Exploration](#data-exploration)
- [Data Format](#data-format)
- [Data Statistics](#data-statistics)
- [Usage in the Project](#usage-in-the-project)

#### Description of Data

Provide a brief overview of the data included in "nbi_data_set.xlsx." What type of information does it contain, and how is it related to the main project?

#### Data Exploration

Outline any key findings or insights obtained from exploring the data in "nbi_data_set.xlsx." This could include statistical summaries, visualizations, or patterns discovered.

#### Data Format

Describe the format of the data, including the types of columns and any specific formatting conventions used.

#### Data Statistics

Highlight important statistical measures or metrics related to the data in "nbi_data_set.xlsx." This could include counts, averages, or any other relevant statistics.

#### Usage in the Project

Explain how the information or data from "nbi_data_set.xlsx" is utilized in the main project. Does it impact the model, contribute to the analysis, or serve any other crucial purpose?

### Conclusion

Summarize the role and significance of "nbi_data_set.xlsx" in the context of the overall project.

---

<!-- Continue with the rest of your README -->
