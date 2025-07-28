select top 20 * from pizza_sales --where pizza_size='M' and pizza_category='Classic' and quantity>=2;

select sum(total_price) as total_sum from pizza_sales;

select sum(total_price)/count(distinct order_id) as average from pizza_sales;

--total orders placed
select COUNT(DISTINCT ORDER_ID) as total_order_placed FROM pizza_sales;

--Average pizza per order
select cast(cast(count(pizza_id) as decimal(10,2)) 
/ cast(count(distinct order_id) as decimal(10,2)) AS DECIMAL(10,2)) 
as pizza_per_order from pizza_sales;

--COUNT DISTINCT WEEKDAYS ORDERS
SELECT DATENAME(DW, ORDER_DATE) AS ORDER_DAY, COUNT(DISTINCT order_id) AS TOTAL_ORDERS
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)
ORDER BY TOTAL_ORDERS;

select distinct order_date from pizza_sales;

SELECT DATENAME(month, order_date) as month_name, count(distinct order_id) as total_orders from pizza_sales
group by DATENAME(month, order_date);

--pizza category sales
select pizza_category, sum(total_price)*100/(select sum(total_price) from pizza_sales) as total_perc_sales
from pizza_sales
group by pizza_category;

select pizza_name, round(sum(total_price),2) as total_revenue from pizza_sales
group by pizza_name
order by total_revenue desc;

AKASH-PC\SQLEXPRESS