select * from sales

select * from customer

select * from product


--1)create a report of all state sales, quantity, discount , profit  with following aggrigation ,                         
-- sum , avg, min , max, count	

	--sum of all
select c.state, sum(s.sales) as "total_sales", sum(s.quantity) as "total_quantity", 
sum(s.discount) as "total_discount", sum(s.profit) as "total_profit" from sales as s
inner join customer as c
on c.customer_id = s.customer_id
group by c.state

  --avg of all	
select c.state, avg(s.sales) as "avg_sales", avg(s.quantity) as "avg_quantity", 
avg(s.discount) as "avg_discount", avg(s.profit) as "avg_profit" from sales as s
inner join customer as c
on c.customer_id = s.customer_id
group by c.state

  --min of all
select c.state, min(s.sales) as "minimum_sales", min(s.quantity) as "minimum_quantity", 
min(s.discount) as "minimum_discount", min(s.profit) as "minimum_profit" from sales as s
inner join customer as c
on c.customer_id = s.customer_id
group by c.state

  --max of all
select c.state, max(s.sales) as "maximum_sales", max(s.quantity) as "maximum_quantity", 
max(s.discount) as "maximum_discount", max(s.profit) as "maximum_profit" from sales as s
inner join customer as c
on c.customer_id = s.customer_id
group by c.state
	
  --count of all
select c.state, count(s.sales) as "count_sales", count(s.quantity) as "count_quantity", 
count(s.discount) as "count_discount", count(s.profit) as "count_profit" from sales as s
inner join customer as c
on c.customer_id = s.customer_id
group by c.state
	
--report of all state sales,quantity,discount,profit with aggregition sum,avg,min,max,count
	
select c.state, sum(s.sales) as "total_sales", sum(s.quantity) as "total_quantity", 
sum(s.discount) as "total_discount", sum(s.profit) as "total_profit", 
avg(s.sales) as "avg_sales", avg(s.quantity) as "avg_quantity", 
avg(s.discount) as "avg_discount", avg(s.profit) as "avg_profit",
min(s.sales) as "minimum_sales", min(s.quantity) as "minimum_quantity", 
min(s.discount) as "minimum_discount", min(s.profit) as "minimum_profit",
max(s.sales) as "maximum_sales", max(s.quantity) as "maximum_quantity", 
max(s.discount) as "maximum_discount", max(s.profit) as "maximum_profit",
count(s.sales) as "count_sales", count(s.quantity) as "count_quantity", 
count(s.discount) as "count_discount", count(s.profit) as "count_profit"
from sales as s
inner join customer as c
on c.customer_id = s.customer_id
group by c.state
	
--2) get data of all state and city's avg customer age 

select c.state, c.city, avg(age) from customer as c
group by c.state, c.city


--3) get data of 2017 to 2018  with product name and sales per quantity 

select s.order_date, p.product_name, sum(s.sales)/ sum(s.quantity) from sales as s
inner join product as p
on s.product_id = p.product_id
where s.order_date between '2017-01-01' AND '2018-12-31'	
group by s.order_date, p.product_name


