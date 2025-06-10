-- Create Database --
CREATE DATABASE walmart_customer_data;
USE walmart_customer_data;

-- Create Table --
CREATE TABLE customer_orders (
    customer_id VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    city VARCHAR(50),
    category VARCHAR(50),
    product_name VARCHAR(100),
    purchase_date DATE,
    purchase_amount DECIMAL(10,2),
    payment_method VARCHAR(50),
    discount_applied VARCHAR(5),
    rating INT,
    repeat_customer VARCHAR(5)
);

-- Verify Dataset Rows --
SELECT * FROM customer_orders LIMIT 5;

-- Insightful SQL QUeries --
## 1. Average Spend by Gender
SELECT 
    Gender, 
    ROUND(AVG(purchase_amount), 2) AS Avg_Spend
FROM 
    customer_orders
GROUP BY 
    gender;

## 2. Average Spend: Repeat vs New Customers
SELECT 
    Repeat_Customer, 
    ROUND(AVG(purchase_amount), 2) AS Avg_Spend
FROM 
    customer_orders
GROUP BY 
    repeat_customer;
    
## 3. Top 5 Age Groups by Total Spend
SELECT
	age,
    ROUND(SUM(purchase_amount), 2) AS Total_Spend
FROM 
	customer_orders
GROUP BY
	age
ORDER BY 
	Total_Spend DESC
LIMIT 5;

## 4.Total Revenue by Product Category
SELECT
	category,
    ROUND(SUM(purchase_amount), 2) AS Total_Revenue
FROM
	customer_orders
GROUP BY 
	category
ORDER BY
	Total_Revenue DESC;
    
## 5. Are Discounts Affecting Ratings?
SELECT 
    Discount_Applied, 
    ROUND(AVG(Rating), 2) AS Avg_Rating
FROM 
    customer_orders
GROUP BY 
    Discount_Applied;
    
## 6. Monthly Revenue Trend
SELECT 
    DATE_FORMAT(Purchase_Date, '%Y-%m') AS Month,
    ROUND(SUM(Purchase_Amount), 2) AS Monthly_Revenue
FROM 
    customer_orders
GROUP BY 
    Month
ORDER BY 
    Month;

## 7. Top 5 Cities by Revenue
SELECT
	city,
    ROUND(SUM(purchase_amount), 2) AS Total_Revenue
FROM
	customer_orders
GROUP BY
	city
ORDER BY
	Total_Revenue DESC
LIMIT 5;

## 8. Payment Method Preference
SELECT 
    payment_method, 
    COUNT(*) AS Usage_Count
FROM 
    customer_orders
GROUP BY 
    payment_method
ORDER BY 
    Usage_Count DESC;

## 9. Average Rating by Product Category
SELECT 
    Category, 
    ROUND(AVG(rating), 2) AS Avg_Rating
FROM 
    customer_orders
GROUP BY 
    category
ORDER BY 
    Avg_Rating DESC;
    
## 10. Top 5 Best-Selling Products (by quantity)
SELECT 
    Product_Name, 
    COUNT(*) AS Orders
FROM 
    customer_orders
GROUP BY 
    Product_Name
ORDER BY 
    Orders DESC
LIMIT 5;
