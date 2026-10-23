
-- 1. View all sales records
SELECT *
FROM Sales;

-- 2. Calculate total revenue
SELECT
    SUM(Quantity * Price) AS Total_Revenue
FROM Sales;

-- 3. Total sales by product
SELECT
    Product,
    SUM(Quantity * Price) AS Product_Revenue
FROM Sales
GROUP BY Product
ORDER BY Product_Revenue DESC;

-- 4. Sales by category
SELECT
    Category,
    SUM(Quantity * Price) AS Category_Revenue
FROM Sales
GROUP BY Category
ORDER BY Category_Revenue DESC;

-- 5. Total quantity sold
SELECT
    SUM(Quantity) AS Total_Quantity_Sold
FROM Sales;

-- 6. Monthly sales analysis
SELECT
    EXTRACT(YEAR FROM Order_Date) AS Sales_Year,
    EXTRACT(MONTH FROM Order_Date) AS Sales_Month,
    SUM(Quantity * Price) AS Monthly_Revenue
FROM Sales
GROUP BY
    EXTRACT(YEAR FROM Order_Date),
    EXTRACT(MONTH FROM Order_Date)
ORDER BY Sales_Year, Sales_Month;
