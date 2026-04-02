#1. Yearly Sales Trend
SELECT YEAR(order_date) AS year, SUM(`actual price`) AS total_sales
FROM sales
GROUP BY YEAR
ORDER BY year;
#2.Top 10 countries by sales
select country,sum(`Actual Price`)as Total_sales from sales
group by country order by total_sales desc limit 10;
#3.Sales by product
select item,sum(`Actual Price`)as Total_sales from sales
group by item order by total_sales desc;
#4.Average Discount per item
select item,round(avg(`discount %`),2) as Avg_discount from sales group by item order by Avg_discount desc;
#5.Salesperson performance by sales
select salesperson, sum(`Actual Price`) as total_sales from sales group by salesperson 
order by total_sales desc limit 10;
#6.Region-wise product distribution
select region, item, count(item) as total_item_sold from sales
group by region,item order by region,total_item_sold desc;
#7. Category contribution for USA
select item,sum(`actual price`)as total_revenue,concat(
round(sum(`actual price`)*100/sum(sum(`actual price`))over (),2),'%')
 as contribution_percentage from sales
where region ="NA" and country="USA" group by item order by total_revenue desc