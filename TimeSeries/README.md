# Time Series Analysis with Stationarity Check

This Jupyter notebook (`Time_series_analysis.ipynb`) focuses on time series analysis with a primary emphasis on checking stationarity. The analysis is conducted on the 'flights' dataset, and various techniques are used to assess and improve the stationarity of the time series.

## Table of Contents

- [Overview](#overview)
- [Stationarity Check](#stationarity-check)
- [Feature Engineering](#feature-engineering)
- [Augmented Dickey-Fuller Test](#augmented-dickey-fuller-test)
- [KPSS Test](#kpss-test)
- [ARIMA Modeling](#arima-modeling)
- [SARIMAX Modeling](#sarimax-modeling)
- [Results and Visualizations](#results-and-visualizations)
- [Future Predictions](#future-predictions)
- [Conclusion](#conclusion)

## Overview

The notebook includes the following main sections:

- Loading and exploring the 'flights' dataset.
- Visualizing the time series data.
- Conducting stationarity checks using Augmented Dickey-Fuller and KPSS tests.
- Feature engineering for time series.
- Building ARIMA and SARIMAX models for predictions.
- Evaluating model performance.

## Stationarity Check

The stationarity check involves visualizing the time series and performing statistical tests. The following techniques are used:

- Line plots for visualizing passenger counts over time.
- Augmented Dickey-Fuller test for statistical assessment.
- Kwiatkowski-Phillips-Schmidt-Shin (KPSS) test for additional verification.

## Feature Engineering

Feature engineering is applied to the time series, including shifts, differences, and transformations. This enhances the stationarity of the data for better modeling.

## Augmented Dickey-Fuller Test

The Augmented Dickey-Fuller test is employed to determine the stationarity of the time series. The test results are displayed along with visualizations of rolling mean and standard deviation.

## KPSS Test

The KPSS test is used as an additional stationarity check. Similar to the ADF test, the results are displayed along with visualizations.

## ARIMA Modeling

ARIMA modeling is performed on the time series data, and predictions are compared against the actual values. The notebook demonstrates how to train the ARIMA model and evaluate its performance.

## SARIMAX Modeling

SARIMAX modeling is applied to the time series with seasonal components. The predictions are compared against the actual values, and the model's performance is evaluated.

## Results and Visualizations

Results from the tests and model predictions are visualized using line plots. The notebook includes comparisons between actual values and predicted values.

## Conclusion

In conclusion, the time series analysis and modeling have provided valuable insights into the stationarity of the 'flights' dataset. The Augmented Dickey-Fuller and KPSS tests have been instrumental in assessing and confirming the stationarity of the time series. The ARIMA and SARIMAX models have demonstrated their effectiveness in predicting future values.

Feel free to explore the notebook and adapt the code to your specific time series analysis needs!

![Stationarity](https://miro.medium.com/v2/resize:fit:4800/format:webp/1*xdblkZyg6YmmReAkZHUksw.png)
