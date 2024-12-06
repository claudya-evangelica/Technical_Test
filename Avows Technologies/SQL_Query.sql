-- Membuat table daily_sales_cleaned
CREATE TABLE daily_sales_cleaned (
    transaction_id VARCHAR(50),
    product_id INTEGER,
    quantity INTEGER,
    price NUMERIC(10, 2),
    transaction_date DATE,
    total_revenue NUMERIC(10, 2)
);

-- Validasi jumlah data yang telah diload
select * from daily_sales_cleaned;
select count(*) Total from daily_sales_cleaned;

-- Total pendapatan harian
SELECT  to_char(transaction_date, 'YYYY-MM-DD') "Date", SUM(total_revenue) as Total_Revenue FROM daily_sales_cleaned
group by to_char(transaction_date, 'YYYY-MM-DD') order by to_char(transaction_date, 'YYYY-MM-DD');


-- Top 3 Products by Quantity
select product_id, sum(quantity) as total_quantity FROM daily_sales_cleaned
group by product_id order by sum(quantity) desc limit 3;


-- Top 3 Products by Revenue
select product_id, sum(total_revenue) as total_revenue FROM daily_sales_cleaned
group by product_id order by sum(total_revenue) desc limit 3;
