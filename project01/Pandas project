# -*- coding: utf-8 -*-

# -- Project --

# # Final Project - Analyzing Sales Data
# 
# **Date**: 23 March 2024
# 
# **Author**: Supitcha T.
# 
# **Course**: `Pandas Foundation`


# import data
import pandas as pd
df = pd.read_csv("sample-store.csv")

# preview top 5 rows
df.head()

# shape of dataframe
df.shape

# see data frame information using .info()
df.info()

# We can use `pd.to_datetime()` function to convert columns 'Order Date' and 'Ship Date' to datetime.


# example of pd.to_datetime() function
pd.to_datetime(df['Order Date'].head(), format='%m/%d/%Y')

# TODO - convert order date and ship date to datetime in the original dataframe
df['Order Date'] = pd.to_datetime(df['Order Date'], format='%m/%d/%Y')
df['Ship Date'] = pd.to_datetime(df['Ship Date'], format='%m/%d/%Y')

# TODO - count nan in postal code column
df['Postal Code'].isna().sum()
# Postal code column has 11 missing values.

# TODO - filter rows with missing values
df[df.isna()]

# ## Data Analysis Part
# 


# TODO 01 - how many columns, rows in this dataset
df.shape
#9994 rows, 21 columns

# TODO 02 - is there any missing values?, if there is, which colunm? how many nan values?
df.isna().sum()

# TODO 03 - your friend ask for `California` data, filter it and export csv for him

#Filter 'California'
ca = df[df['State'] == "California"]

# export to .csv file
ca.to_csv('ca.csv')

# TODO 04 - your friend ask for all order data in `California` and `Texas` in 2017 (look at Order Date), send him csv file

#Filter 'California' or 'Texas' in the assigned date range
ca_tx_2017 = df[(df['State'].isin(['California','Texas'])) & (df['Order Date'] >= '2017-01-01') & (df['Order Date'] <= '2017-12-31')]

# export to .csv file
ca_tx_2017.to_csv('ca_tx_2017.csv')

# TODO 05 - how much total sales, average sales, and standard deviation of sales your company make in 2017

# Date range
record_2017 = df[(df['Order Date'] >= '2017-01-01') & (df['Order Date'] <= '2017-12-31')]

# total sales, average sales, and standard deviation
sales_2017 = record_2017['Sales'].agg({'sum':'sum','mean': 'mean','std':'std'}).reset_index()
sales_2017

# TODO 06 - which Segment has the highest profit in 2018

#Date range
record_2018 = df[(df['Order Date'] >= '2018-01-01') & (df['Order Date'] <= '2018-12-31')]

# Segment that has the highest profit in 2018 
highest_profit_2018_segment = record_2018.groupby('Segment')['Profit'].sum().sort_values(ascending=False).head(1)
highest_profit_2018_segment

# TODO 07 - which top 5 States have the least total sales between 15 April 2019 - 31 December 2019

#Date range
record_apr_dec2019 = df[(df['Order Date'] >= '2019-04-15') & (df['Order Date'] <= '2019-12-31')]

# 5 States that have 5 least sales 
least_sales_states = record_apr_dec2019.groupby('State')['Sales'].sum().sort_values(ascending=False).tail(5)
least_sales_states

# TODO 08 - what is the proportion of total sales (%) in West + Central in 2019 e.g. 25% 

#Date range
record_2019 = df[(df['Order Date'] >= '2019-01-01') & (df['Order Date'] <= '2019-12-31')]

#Sales of West + Central in 2019
West_central_2019 = record_2019[(record_2019['Region'].isin(['West','Central']))]
West_central_sales_2019 = West_central_2019['Sales'].sum()
#West_central_sales_2019  = 334909.5525

#Total Sales of USA in 2019
Total_sales2019 = record_2019['Sales'].sum()
# Total_sales2019 = 609205.598

#Calculate proportion
def propotion(val1, val2):
    return val1/val2

result = propotion(West_central_sales_2019, Total_sales2019)

print(result)
#proportion 0.55% 

# TODO 09 - find top 10 popular products in terms of number of orders vs. total sales during 2019-2020

#Date range
record_2019_2020 = df[(df['Order Date'] >= '2019-01-01') & (df['Order Date'] <= '2020-12-31')]

#Top 10 by number of orders
No_of_orders = record_2019_2020.groupby('Product Name')['Order ID'].count().sort_values(ascending=False).head(10)

#Top 10 by total sales
Total_sales_product = record_2019_2020.groupby('Product Name')['Sales'].sum().sort_values(ascending=False).head(10)

# TODO Bonus - which Category has the highest profit in 2018


# Catetory that has the highest profit in 2018 
highest_profit_2018 = record_2018.groupby('Category')['Profit'].sum().sort_values(ascending=False).head(1)
highest_profit_2018

# Top 3 popular categories by number of orders
record_2019_2020["Category"].value_counts().plot(kind='bar',color=['salmon','orange','gold'])

# Total sales of California and Texas in 2017
ca_tx_2017.groupby("State")[["Sales"]].sum().plot(y='Sales', kind='bar', color='Skyblue', ylabel='Total Sales')

# TODO Bonus - use np.where() to create new column in dataframe to help you answer your own questions

import numpy as np
avg_profit_2018 = np.mean(record_2018['Profit'])
avg_profit_2018

