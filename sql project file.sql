--                                     THEORY QUESTIONS ( PART 1 ) 

-- Q1) what is SELECT in sql ?
-- It is a statement used to retrive data from a database table and display it as a result .

-- Q2) difference between SELECT * and select column ?
-- SELECT * retrives all columns from the table but select column retrives only the specified columns from the table .

-- Q3) why FROM is mandatory ?
-- it is mandatory because it specifies the source of the data you want to work with in SQL .

-- Q3) what is column alias ?
-- it is a alternative name given to a specific column to make results more readable and understandable .

-- Q4) difference between alias and actual column name ?
-- the actual column name is a permanent name of a column defined in the database table whereas alias is temporary name used in query .

-- Q5) why comments are important in SQL ?
--  comments are important beacuse they make code easier to understand and readable .   

 
 --                               QUERY ( PART 1 ) 
 
 use bigbasket ; 
 
 -- Q1)  select only customer name ? 
 SELECT name FROM customers ;
 
 -- Q2) select customer name and city ?
 SELECT name , address FROM customers ;
 
-- Q4) fetch phone only ?
 select phone 
 from customers ; 

-- Q5) write a query with comments ?
-- this query fetches name, 
 select name 
 from customers ; 



--                                         MINI PROJECT (1) 

-- 1) display full customer data ?
 select * from customers ;

-- 2) show only name and email ?
 select name , email from customers ; 

-- 3) rename columns for excel export ?

alter table customers 
change email eamil_address varchar (100) ;

-- 4) save queries for reuse ? 



--                                        THEORY QUESTIONS ( PART 2 )

-- 1) what is LIKE operator ?
-- like operator is used in SQL to search for a pattern in text ( string ) data .
 
 -- 2) difference between % and _ ?
 -- % matches any number of characters, whereas _ matches only specified character .
 
 -- 3) is between inclusive or exclusive ?
 -- between is inclusive as it includes both starting and ending values .
 
 -- 4) difference between IN and OR ?
 -- IN is used to check multiple values in a single column whereas OR is used to combine multiple conditions .
 
 -- 5) when to use LIKE vs = ?
 -- = is used to search for exact matches and on the other hand LIKE is used to find same patterns-based searches .
 
 -- 6) can BETWEEN be used with dates ?
 -- between can be used with dates and it includes both start and end dates .
 
  
  --                                QUERY ( PART 2 )
  
  -- Q1) find customers whose name starts with ' R ' ?
 select * from customers 
where name like ' R% ' ;

  -- Q2) fetch products priced between 500-900 ?
   select * from product 
   where price between 500 and 900 ; 
       
  -- Q3) find orders paid using UPI or COD ?
   select * from orders 
  where payment_method IN ( 'UPI' , 'COD' );
  
  -- Q4) find deliveries handled by Ekart ?
   select * from delivery 
  where service_partner = 'Ekart' ;
  
  -- Q5) find products with word ' shirt ' ?
   select * from product 
   where product_name like ' %shirt% ' ;
  
  -- Q6) find customers using gmail ?
   select * from customers 
   where eamil_address like ' %@gmail.com ' ;
  
  
  --                                 MINI PROJECT (2)
  
  -- 1) search customers by name pattern ?
  -- for example: name starts with S 
        select * from customers 
        where name like 'S%' ;
  
  -- 2) filter products by price range ?
  --  for example: 5000 to 10000
      select * from product 
     where price between 5000 and 10000 ;
  
  -- 3) filter orders by payment method ?
  -- for example: UPI or NETBANKING 
       select * from orders 
      where payment_method in ( 'upi' , ' net banking ' ) ;
  
  -- 4) identify fast deliveries ?
  -- for example: delivery in 2 days or less 
        select * from delivery 
        where shipment_days <=2 ; 
  
  -- 5) combine multiple filters in one query ?
  -- for example: product price between 30-1000
  --            : product name contains jeans 
      select * from product 
     where price between 30 and 1000
      and product_name like '%jeans%' ;
  
  --                                THEORY QUESTIONS ( PART 3 )
  
  -- Q1) what does distinct do ?
  -- distinct removes duplicate or repeated values .
  
  -- Q2) default sorting order in SQL ?
  -- ASC ( ascending order ) is default sorting order in SQL .
  
  -- Q3) why order by is slow sometimes ?
  -- it is slow because the databse must sort large amounts of data before displaying results .
  
  -- Q4) can limit be used without order by ?
  -- yes, limit can be used without order by, but the rows returned are not in a fixed or predictable order .
  
  -- Q5) difference between ASC and DESC ?
  -- ASC sorts data from lowest to highest or A to Z, while DESC sorts data from highest to lowest or Z to A. 
  
  --                              QUERY ( PART 3) 
  
  -- 1) show unique payment methods ?
select distinct payment_method 
from orders ;
  
  -- 2) show unique product categories /
select distinct category 
from product ;
  
  -- 3) show top 5 expensive products ?
select product_name , price from product 
order by price desc 
LIMIT 5 ;
  
  -- 4) show latest 3 orders ?
select * from orders 
order by order_date desc 
limit 3 ;
  
  -- 5) sort sellers by rating ?
select name, ratings from seller
order by ratings desc ;
  
  -- 6) show cheapest 5 products ?
select product_name, price 
from product 
order by price ASC  limit 5 ;
  
  --                            MINI PROJECT (3) 
  
  -- 1) top 5 expensive products ?
select product_name, price from product 
order by price desc  limit 5 ;
  
  -- 2) cheapest products list ?
select product_name, price from product 
   order by price ASC ;
  
  -- 3) unique categories list ?
select distinct category 
   from product ; 
  
  -- 4) latest orders snapshot ?
select order_id, order_date
from orders 
order by order_date desc ;
  
  -- 5) best rated sellers ?
select name, ratings
from seller
order by ratings DESC ; 
  
  --                                       THEORY QUESTIONS (PART 4 )
  
  -- Q1) what is GROUP BY ?
  -- group by groups rows that have the same values and itmis used with aggregate functions .
  
  -- Q2) why having is required ?
  -- having is used to filter groups after aggregation .
  
  -- Q3) difference between where and having ?
  --  where cannot be used with aggregate functions however having can be used with aggregated functions.
   
-- Q4) SQL execution order ?
-- from
-- where
-- group by 
-- having 
-- select 
-- order by 

-- Q5) can group by work without aggregate ?
-- yes, but it will same as DISTINCT . 

-- Q6) can having exist without group by ?
-- yes but only when using aggregate functions. 

--                                 QUERY (PART 4 )

-- 1) count products per category ?
  select category, count(*) as total_products 
  from product 
  group by category ;
  
-- 2) average price per category ?
select category, avg(price) as avg_price 
from product 
group by category ;

-- 3) orders per payment method ?
select payment_method, count(*) as total_orders
from orders 
group by payment_method ; 

-- 4) delivered orders per payment method ?
select payment_method, count(*) as delivered_orders
from orders 
where order_status = 'fulfilled' 
group by payment_method ; 

-- 5) categories with more than 1 product ?
select category , count(*) as total_products
from product 
group by category
having count(*) > 1 ; 

-- 6) payment methods with more than 2 orders ?
select payment_method , count(*) as total_orders 
from `orders` 
group by payment_method 
having count(*) > 2 ;

--                                 MINI PROJECT (4) 

-- 1) product distribution by category ?
 select category , count(*) as total_products 
 from product
 group by category ; 
 
 -- 2) average price per category ?
 select category , avg(price) as avg_price 
 from product
 group by category ; 
 
 -- 3) most used payment method ?
 select payment_method , count(*)  as total_orders 
 from `orders` 
 group by payment_method 
 order by total_orders desc 
 limit 1 ; 
 
 -- 4) categories with high average price ?
 select category , avg(price) as avg_price 
 from product
 group by category 
 having avg(price) > 200 ;
 
 -- 5) order distribution analysis ?
 select order_status , count(*) as total_orders 
 from orders 
 group by order_status ; 
 
 --                                      THEORY QUESTIONS (PART 5 )
 
 -- Q1) what is join in sql ?
 -- join is used to combine rows from two or more tables based on a related column between them .
 
 -- Q2) difference between inner and left join ?
 -- INNER JOIN  retuns only matching rows from both the tables whereas LEFT JOIN  returns all rows from left table and matching rows from right.
 
 -- Q3) when to use left join ?
 -- when the requirement is to have all records from the left table .
 
 -- Q4) can right join be replaced ?
 -- yes, RIGHT JOIN can always be replaced .
 
 -- Q5) what happens if no match in join ?
 -- NULL values will be shown in every join type except INNER JOIN .
 
 -- Q6) difference between on and where ?
 -- ON is used to define join condition however WHERE is used to filter result rows .  
 
 --                            QUERY (PART 5 )
 
 -- 1) list customers with their orders ? 
 select c.customer_id , c.name , o.order_id , o.order_date 
 from customers c
 inner join orders o
 on c.customer_id = o.customer_id ;
 
 -- 2) show products with seller details ?
 select p.product_id , p.product_name , s.seller_id , s.city 
 from product p
 inner join seller s 
 on p.seller_id = s.seller_id ; 
 
 -- 3) find customers with no orders 
 select c.customer_id , c.name 
 from customers c 
 left join orders o 
 on c.customer_id = o.customer_id 
 where o.order_id is null ; 
 
 -- 4) show order delivery details ?
select o.order_id , o.order_date , d.service_partner , d.status 
from orders o 
inner join delivery d 
on o.order_id = d.order_id ;

-- 5) find products without reviews ?
select p.product_id , p.product_name 
from product p
left join reviews r 
on p.product_id = r.product_id 
where review_id is null ; 

-- 6) count orders per customer ?
select c.customer_id , c.name , count(o.order_id) as total_orders 
from customers c 
left join orders o
on c.customer_id = o.customer_id 
group by c.customer_id , c.name ;

--                                    MINI PROJECT (5) 

-- Q1) customer order report ?
select c.customer_id , c.name , o.order_id , o.order_date , o.payment_method 
from customers c 
inner join orders o 
on c.customer_id = o.customer_id ; 

-- Q2) product seller mapping ?
select p.product_id , p.product_name , s.city , s.seller_id , s.name as seller_name 
from product p
inner join seller s 
on p.seller_id = s.seller_id ;

-- Q3) delivery performance report ?
select o.order_id , o.order_date , d.service_partner , d.status , d.shipment_days
from orders o
inner join delivery d 
on o.order_id = d.order_id ;

-- Q4) customers with no orders ?
select c.customer_id , c.name 
from customers c 
left join orders o 
on c.customer_id = o.customer_id
where o.order_id is null ; 

--                           THEORY QUESTIONS (PART 6) 

-- Q1) what is full outer join ?
-- it is a type of join which returns all matching rows and all non- matching rows from both tables 

-- Q2) does mysql support full join ?
-- no, mysql does not support full outer join directly . 

-- Q3) how do you simulate full outer join in mysql ?
-- full outer join can be used using left join with right join and union .

-- Q4) what is self join ?
-- self join is joining a table with itself and used when rows in the table are related .

-- Q5) when is self join used ?
-- when we have to compare rows within the same table .

-- Q6) what is cross join ?
-- cross join helps one to join every row of first table with every row from another table 

-- Q7) why cross join is dangerous ?
-- it is dangerous because it creates very large results .

-- Q8) difference between inner and full join ?
-- inner join shows only matching rows whereas in full outer join all rows regardless of it's match is shown 

-- Q9) what happens when no match in left join ?
-- left table will still appear but right table will show null . 

-- Q10) can self join use same column ?
-- yes, we can use self join for same column .

-- Q11) how many rows does cross join return ?
-- every row from table A joins with every row from table B .

-- Q12) real-world use case of self join ?
-- it is use to compare rows within column : find employees and their managers in one employee table . 

--                               QUERY (PART 6 ) 

-- 1) show all customers and orders (full join logic ) ?
  select c.customer_id , c.name , c.address , o.order_id , o.order_status , o.payment_method 
  from customers c 
  left join orders o 
  on c.customer_id = o.customer_id 
  union
  select c. customer_id , c.name , c.address , o.order_id , o.order_status , o.payment_method 
  from customers c 
  right join orders o 
  on c.customer_id = o.customer_id ; 
  
  -- 2) find customers without orders ?
   select c.customer_id , c.name , o.order_id 
  from customers c 
  left join orders o 
  on c.customer_id = o.customer_id  
  where o.order_id is null ; 
  
  -- 3) find orders without delivery ?
  select o.order_id , o.order_status , o.order_date , d.delivery_id 
  from orders o 
  left join delivery d 
  on o.order_id = d.order_id 
  where o.order_status <> 'fulfilled' ;
  
  -- 4) find products without reviews ?
  select p.product_id , p.category , p.product_name , r.customer_id , r.ratings , r.review_text 
  from product p 
  left join reviews r 
  on p.product_id = r.product_id 
  where r.review_text is null ; 
  
  -- 5) compare products in same category ?
  
  
  
  
  
  -- 6) create customer city comparison ?
  
  
  
  
  
  -- 7) create product × seller combinations ?
  select  p.product_name , s.seller_id  
  from product p 
  cross join seller s ;
  
  -- 8) count unmatched rows in join ?
  select count(*) as unmatched_count 
  from customers c 
  left join orders o 
  on c.customer_id = o.customer_id  
  where o.order_id is null ; 
  
  -- 9) find delivery records without orders ?
  select d.delivery_id , d.shipment_days , d.status 
  from delivery d 
  left join orders o 
  on d.order_id = o.order_id 
  where o.order_id is null ; 
  
  -- 10) show cross join output count ?
  select  count(*) as total_rows 
  from orders
  cross join customers ; 
  
  -- 11) replace right join with left join ?
  select * 
  from orders o 
  right join customers c 
  on c.customer_id = o.customer_id ; 
  
  -- 12) identify orphan records ?
  
  
  
  --                          MINI PROJECT (1) 
  
  -- 1) find missing orders ?
  select c.customer_id , c.name , c.address , o.order_id 
  from customers c 
  left join orders o 
  on c.customer_id = o.customer_id 
  where o.order_id is null ; 
  
  -- 2) find missing deliveries ?
  select o.order_id , o.order_date 
  from orders o 
  left join delivery d 
  on o.order_id = d.order_id 
  where d.delivery_id is null ; 
  
  -- 3) find missing reviews ?
  select o.order_id , o.order_date , r.product_id 
  from orders o 
  left join reviews r 
  on o.order_id = r.order_id 
  where r.review_id is null ;
  
  --                                   MINI PROJECT (2) 
  
  -- 1) customers with orders ?
  select c.customer_id , c.name , o.order_id , o.order_date 
  from customers c 
  left join orders o 
  on c.customer_id = o.customer_id ; 
  
  -- 2) customers without orders ?
  select c.customer_id , c.name , o.order_id 
  from customers c
  left join orders o 
  on c.customer_id = o.customer_id 
  where order_id is null ; 
  
  -- 3) % conversion ?
  select ( count(distinct customer_id) * 100) / 
  (select count(*) from customers)
  as conversion_rate from orders ; 
  
  
  
  --                               THEORY QUESTIONS (PART 7) 
  
  -- 1) What is union in SQL?
-- union combines results of two or more select queries and removes duplicate rows.

-- 2) Difference between union and union all ?
-- union removes duplicates, while union all keeps all rows including duplicates.

-- 3) Why does union remove duplicates?
-- Because union applies distinct automatically to return only unique rows.

-- 4) Which is faster union or union all ?
--  union all is faster because it does not remove duplicates.

-- 5) Can union combine different tables?
-- Yes, UNION can combine results from different tables if column rules are followed.

-- 6) Column rules for union ?
-- Number, order, and data types of columns must be same in all select queries.

-- 7) Can order by be used inside union queries?
-- order by is used only once at the end of the full union query.

-- 8) union vs join difference ?
-- union combines rows vertically, while join combines columns horizontally.

--                           QUERY (PART 7)

-- 1) combine customer & seller names ?
select name as cs_name 
from customers 
union 
select name from seller ; 

-- 2) combine delivered and cancelled orders ?
select order_id , order_status 
from orders where order_status = ' fulfilled ' 
union 
select order_id , order_status 
from orders where order_status = ' cancelled ' ;

-- 3) create activity log using orders + deliveries ?




-- 4) combine multiple order statuses ?
 select * from orders where order_status = ' fulfilled '
 union all 
 select * from orders where order_status = ' cancelled '
 union all 
 select * from orders where order_status = ' pending ' ; 
 
 -- 5) show customer count and order count in one result ?
 select ' customers' as type , count(*) from customers as total_customers 
 union all 
 select 'orders' , count(*) from orders ; 

-- 6) use union all for faster report ?
select address from customers 
union all 
select city from seller ; 

-- 7) sort union result alphabetically ?
select name from seller 
union 
select name from customers 
order by name ; 

-- 8) combine products and sellers names ?
select product_name as name from product
union 
select name from seller ; 

-- 9) create combined city list ?
select address from customers 
union 
select city from seller ;

-- 10) find duplicate rows using union vs union all ?





--                                  MINI PROJECT (1) 

-- 1) create a combined list of customers and sellers with a role column ?
select customer_id as id, name ,
'customer' as role from customers 
union all
select seller_id , name ,
'seller' as role from seller ; 


--                           THEORY QUESTIONS (PART 8) 

-- 1) what is a subquery?
-- A subquery is a query written inside another sql query to return data used by the main query.

-- 2) types of subqueries
-- there are three types of subqueries : scalar, row and table .

-- 3) what is scalar subquery?
-- A scalar subquery returns exactly one value (one row, one column).

-- 4) difference between in and exists
-- In compares values, while exists checks whether rows exist and stops after first match.

-- 5) what is correlated subquery?
--  A correlated subquery depends on outer query values and runs once per row.

-- 6) subquery vs join difference
-- Subquery is a nested query, while join combines tables directly for faster performance.

-- 7) can subquery be used in select?
-- Yes, subqueries can be used in select, where, from, and having clauses.

-- 8) execution order of subqueries
-- Inner subquery executes first, then outer query runs using its result.

-- 9) performance issue with correlated subquery
-- It is slow because it runs repeatedly for each row of the outer query.

-- 10) can subquery return multiple columns?
-- yes, but only when used with from or exists, not with = operator.

-- 11) can we nest subqueries?
-- yes, subqueries can be nested inside another subquery.

-- 12) real-world use case of subqueries
-- Used to find top customers, highest salary, latest order, and filtered reports.

--                               QUERY (PART 8 ) 

-- 1) products above average price ?
 select * from product 
 where price >( select avg(price) from product ) ; 
 
 -- 2) latest order details ?
 select * from orders 
 where order_date = (select max(order_date) from orders) ; 
 
 -- 3) customers with orders ?
 select * from customers 
 where customer_id in ( select customer_id from orders ) ; 
 
 -- 4) products with reviews ?
 select * from product 
 where product_id in ( select product_id from reviews ) ; 
 
 -- 5) products priced above category average ?
 select * from product p
 where price > (select avg(price) from product where category = p.category ) ; 
 
 -- 6) orders after average order date ?
 select * from orders 
 where order_date > ( select avg(order_date) from orders ) ; 
 
 -- 7) customers without orders ?
 select * from customers 
 where customer_id not in ( select customer_id from orders ) ; 
 
 -- 8) products with max price per category ?
 select * from product p
 where price = ( select max(price) from product where category = p.category ) ; 
 
 -- 9) count orders using subquery ?
 select (select count(*) from orders ) as total_orders ;
 
 -- 10) compare exists vs in ?
 select * from customers 
 where customer_id in ( select customer_id from orders ) ; 
 
 select * from customers c 
 where exists( select 1 from orders o 
 where o.customer_id = c.customer_id
 ) ; 
 
 -- 11) create derived table query ?
 select * from ( select customer_id , count(*) total_orders from orders 
 group by customer_id )  t ; 
 
 -- 12) use subquery in select ?
  select * from product p
 where price = ( select max(price) from product where category = p.category ) ; 
 
 
 
 --                             MINI PROJECT (1) 
 
 -- 1) find products priced above category average ?
 select * from product p
 where price > ( select avg(price) from product 
 where category = p.category ) ; 
 
 -- 2) segment premium vs normal products ?
 select product_id , product_name , category , price,
 if (price > ( select avg(price) from product where category = p.category ) , 
 ' premium ' , ' normal' )as product_type from product p ; 
 
 --                              MINI PROJECT (2) 
 
 -- 1) identify customers with orders ?
 select * from customers 
 where customer_id in ( select customer_id from orders ) ; 
 
 -- 2) customers without orders 
 select * from customers 
 where customer_id not in ( select customer_id from orders ) ; 
 
 -- 3) latest active customers ?
 select * from customers 
 where customer_id in (
 select customer_id from orders 
 where order_date = ( select max(order_date) from orders )
 ) ; 
 
 --                             THEORY QUESTIONS (PART 9)
 
 -- 1) What is a CTE?
-- A CTE is a temporary named result set used to simplify and organize complex sql queries.

-- 2) Why use CTE instead of subquery?
-- CTE makes queries more readable, reusable, and easier to maintain than subqueries.

-- 3) Is CTE faster than subquery?
-- CTE is not always faster and performance depends on the query and database.

-- 4) Difference between CTE and view ?
-- CTE is temporary and exists only during query execution, while view is stored permanently in database.

-- 5) What is recursive CTE?
-- Recursive CTE is used to process looping data like tree or graph structures.

-- 6) When should CTE be avoided?
-- CTE should be avoided in performance-critical queries where materialization slows execution.

-- 7) Can we use join inside CTE?
-- Yes, joins can be used inside CTE like in normal select queries.

-- 8) Can multiple CTEs exist in one query?
-- Yes, multiple CTEs can be defined in a single query using comma separation.

-- 9) Scope of CTE ?
-- 

-- 10) Can CTE be indexed?
-- 

-- 11) CTE vs temporary table ?
-- CTE is temporary and memory-based for one query, while temporary table can store data and be reused.

-- 12) Real-world use case of CTE
-- 

--                               QUERY (PART 9 ) 

-- 1) create CTE for delivered orders ?
with delivered_orders as (
select * from orders where order_status = ' fulfilled ' )
select * from delivered_orders ; 

-- 2) count delivered orders using CTE ?
with delivered_orders as (
select * from orders where order_status = ' fulfilled ' )
select count(*) from  delivered_orders ; 

-- 3) orders per payment method using CTE ?
with pay_cte as (
select payment_method , count(*) as total 
from orders
group by payment_method)
select * from pay_cte ; 

-- 4) customer order count usong CTE ?
with cust_count as (
select customer_id , count(*) as total 
from orders 
group by customer_id )
select * from cust_count ; 

-- 5) products above average price using CTE ?
  with avg_cte as (
select avg(price) as avg_price from product 
)
select * from product
where price > (select avg_price from avg_cte ) ; 

-- 6) average delivery days using CTE ?
with del_cte as (
select avg(shipment_days) from delivery )
select * from del_cte ;

-- 7) multiple CTEs in one query ?
with cte_1 as ( 
select * from customers ), 
cte_2 as ( 
select * from orders ) 
select * from cte_1  cte_2 ; 

-- 8) replace subquery using CTE ?
with avg_cte  as (
select avg(price) as avg_price from product
)
select * from product 
where price < (select avg_price from avg_cte ) ; 

-- 9) sort CTE result ?
with cte as (
select * from orders 
)
select * from cte order by order_date desc ; 

-- 10) join inside CTE ?
with join_cte as (
select c.name , o.order_id
from customers c
left join orders o 
on c.customer_id = o.customer_id 
)
select * from join_cte ;

-- 11) create KPI report using CTE ?




-- 12) recursive CTE to generate numbers ?
with recursive num_cte as (
select 1 as n
union all
select n+ 1 from num_cte where n<15
)
select * from num_cte ; 

--                            MINI PROJECT (1) 

-- 1) total customers using CTE ?
with cte as ( 
 select count(*) as total_customers from customers )
 select * from cte ;

-- 2) total orders using CTE ?
with cte as 
( select count(*) as total_orders from orders )
select * from cte ; 

-- 3) delivered orders using CTE ?
with cte as 
( select count(*) as delivered_orders
from orders 
where order_status = ' fulfilled ' )
select * from cte ; 

-- 4) average delivery days using cte ?
with cte as ( 
select avg(shipment_days) as avg_delivery_days
from delivery )
select * from cte ;

--                        MINI PROJECT (2) 

-- 1) customers with orders ?
with cte as (
select c.name , o.order_id , c.customer_id
from customers c 
left join orders o 
on c.customer_id = o.customer_id )
select * from cte ;

-- 2) customers without orders ?
with cte as (
  select * from customers
 where customer_id not in ( select customer_id from orders ) 
 )
 select * from cte ;
 
 -- 3)order count per customer ?
 with cte as ( 
 select customer_id , count(*) as total_orders
 from orders 
 group by customer_id )
 select * from cte ;
 
 --                              MINI PROJECT(3) 
 
 -- 1) category average price ?
 with cte as (
 select category , avg(price) as avg_price from product
 group by category )
 select * from cte ;
 
 -- 2) products above benchmark using cte ?
 
 
 --                 MINI PROJECT(4) 
 
 -- 1) DELIVERED ORDERS ?
with cte as 
( select count(*) as delivered_orders
from orders 
where order_status = ' fulfilled ' )
select * from cte ; 

-- 2) average delivery days ?
with cte as ( 
select avg(shipment_days) as avg_delivery_days
from delivery )
select * from cte ;

-- 3) fast vs slow delivery classification ?
--   

--                              THEORY QUESTIONS ( PART 10 ) 

-- 1) what is a window function ?
-- it is a function that performs calculations acreoss a set of realted rows without collapsing it into single row .

-- 2) difference between GROUP BY and WINDOW FUNCTION ?
-- group by performs the same way as window function but GROUP BY collapses the output showing only distinct whereas window function shows each and every row .

-- 3) what does OVER() do ?
-- it defines a window function of rows on which window function performs calculations .

-- 4) purpose of PARTITION BY ?
-- PARTITION BY is used with window function to divide rows into groups and perform calculations .

-- 5) can window functions reduce rows ?
-- no, window functions do not reduce rows, they keep all rows and add calculated values.

-- can where use window functions?
-- no, window functions cannot be used directly in where, use a subquery or cte.

-- window function vs subquery ?
-- window functions are faster and simpler for running totals, ranking, and analytics compared to subqueries.

-- when to use window functions?
-- use window functions for ranking, running totals, moving averages, and group-wise calculations.

-- can we use aggregate functions as window functions?
-- yes, aggregate functions like sum, avg, count, min, max can be used as window functions using over().

-- is partition by mandatory?
-- no, partition by is optional, without it the function works on the full result set.

-- can window functions be nested?
-- no, window functions cannot be directly nested, use subqueries or cte instead.

-- real-world use cases of window functions ?
-- ranking students, salary analysis , monthly growth . 

--                                     QUERY ( PART 10 )

-- 1) show average product price with each product ?
select price , product_name , category ,
avg(price) over() as avg_price 
from product ;

-- 2) average price per category using window function ?
select price ,
product_name ,
category ,
avg(price) over ( partition by category ) as avg_price_category
from product ; 

-- 3) count products per category using window function ?
select product_name, 
price ,
category ,
count(*) over ( partition by category ) as total_pro_category 
from product ; 

-- 4) show total orders per customer ( row level ) ?
select order_id , 
 customer_id ,
 count(order_id) over ( partition by customer_id ) as tot_orders_cust 
 from orders ; 
 
 -- 5) compare price vs category average ?
 
 
 -- 6) show average delivery days per partner ?
 select delivery_id ,
 order_id ,
 service_partner ,
 shipment_days ,
 round(avg(shipment_days) over ( partition by service_partner ), 2) as avg_days
 from delivery ;
 
 -- 7) show category stock value ?
 select product_name , 
 category ,
 stock ,
 sum(stock) over ( partition by category ) as cat_stock_value 
 from product ; 
 
 -- 8) window function without partition by ?
 select price , product_name , category ,
avg(price) over() as avg_price 
from product ; 

-- 9) use window function with join ?
select o.order_id , c.name , 
count(*) over ( partition by c.customer_id ) as total_orders 
from orders o 
join customers c
on o.customer_id = c.customer_id ; 

-- 10) filter rows using window output ?



-- 11) window function vs group by example?
 
 
 
 -- 12) create inventory analytics query ?
 select product_id , 
 product_name , 
 category , 
 stock , 
 sum(stock) over (partition by category ) as total_stock
 from product ; 
 
 --                   MINI PROJECT ( 1 )
 
 -- 1) show product price ?
 select product_id , product_name , price 
 from product ; 
 
 -- 2) show category average price ?
 select price ,
product_name ,
category ,
avg(price) over ( partition by category ) as avg_price_category
from product ; 

-- 3) difference from average ?
  
  
--                         MINI PROJECT (2) 

-- 1) order count per customer ?
select order_id , 
 customer_id ,
 count(order_id) over ( partition by customer_id ) as tot_orders_cust 
 from orders ; 
 
 -- 2) identify repeat customers ?
 select distinct customer_id from 
 ( select customer_id , count(*) over (partition by customer_id ) as cst from orders ) t
 where cst > 1 ; 
 
 --                              THEORY QUESTIONS ( PART 11 )
 
 -- 1) what is row_number?
-- returns a unique number in sequence for each row within a partition based on order by 

-- difference between rank and dense_rank ?
-- rank skips numbers after ties while dense_rank does not skip numbers .

-- when to use row_number?
-- when you need unique row numbering without ties .

-- what happens in rank when values tie?
-- tied rows get same rank and next rank value is skipped .

-- does dense_rank skip numbers?
-- no dense_rank does not skip numbers after ties . 

-- can ranking be used without order by?
-- no order by is mandatory for meaningful ranking .

-- difference between limit and ranking ?
-- limit restricts total rows while ranking filters top rows per group .

-- what is top-n per group?
-- 

-- can ranking work with join?
-- yes ranking functions can be used on joined sets .

-- ranking vs group by ?
-- ranking keeps row detail while group by aggregates rows .

-- can ranking functions be nested?
-- 

-- real-world use cases of ranking ?
-- leaderboards, top sellers per category, salary ranking . 

--                        QUERY ( PART 11 ) 

-- 1) rank products by price ?
select product_name , 
price ,
rank() over ( order by price ) as rank_
from product ; 

-- 2) dense rank products by price ?
 select product_name , 
price ,
dense_rank() over ( order by price ) as rank_
from product ; 

-- 3) assign row number to products ?
select product_id , 
product_name , 
category ,
row_number () over (order by product_id ) as row_num
from product ; 

-- 4) rank products per category ?
select product_id,
product_name , price,
rank () over ( partition by category order by price desc ) as rnk
from product ; 

-- 5) top 3 products per category ?
select * from (select product_id , price , category ,
rank() over ( partition by category order by price desc ) as ran_k 
from product ) t
where ran_k <= 3 ; 

-- 6) rank customers by order count ?
select customer_id , count(*) as order_count ,
rank() over (order by count(*) desc ) rank_ 
from orders 
group by customer_id ; 

-- 7) rank deliveries by speed ?
select delivery_id , service_partner , shipment_days ,
rank() over(order by shipment_days desc ) as rnk 
from delivery  ; 

-- 8) ranking without partition by ?
select product_name , 
price ,
rank() over ( order by price ) as rank_
from product ; 

-- 9) ranking with join ?
select c.customer_id , c.name , 
count(o.order_id ) as order_count,
rank() over (order by count(o.order_id) desc ) as rnk 
from customers c
left join orders o 
on c.customer_id = o.customer_id 
group by c.customer_id ;

-- 10) compare rank vs dense_rank output ?
select product_id , price ,
rank() over ( order by price desc ) as rnk_value 
from product ; 

select product_id , price ,
dense_rank() over ( order by price desc ) as den_rnk_value 
from product ; 

-- 11) create leaderboard query ?



--                                 MINI PROJECT (1) 

-- 1) top 3 expensive products per category ?
select * from (select product_id , category, price ,
rank() over ( partition by category order by price desc ) as ran_k 
from product ) t
where ran_k <= 3 ; 

-- 2) ranking logic ?



--                              MINI PROJECT (2) 

-- 1) rank customers by number of orders ?
select customer_id , count(*) as order_count ,
rank() over (order by count(*) desc ) rank_ 
from orders 
group by customer_id ; 

-- 2) identify top buyers ?
 select * from ( 
 select customer_id , count(*) as order_count ,
 rank() over ( order by count(*) desc ) as rnk 
 from orders 
 group by customer_id 
 ) t 
 where rnk <= 5 ; 
 
 --                                MINI PROJECT(3) 
 
 -- 1) FASTEST DELIVERY PARTNERS ?
 select *
 from (
 select delivery_id , service_partner , shipment_days ,
rank() over(order by shipment_days asc ) as rnk 
from delivery  
) t 
where rnk = 1 ; 

-- 2) order wise delivery ranking ?
select * 
from ( 
select order_id , delivery_id , service_partner , shipment_days ,
rank() over ( partition by order_id order by shipment_days asc ) as rnk
from delivery
 ) t 
 where rnk <= 3 ; 
 
 --                                 QUERY QUESTIONS ( PART 12 ) 
 
 -- 1) what is date datatype?
-- stores only date in format yyyy-mm-dd without time.

-- difference between date and datetime ?
-- date stores only date, datetime stores date + time (yyyy-mm-dd hh:mm:ss).

-- what does now() return?
-- returns current system date and time.

-- difference between now() and curdate() ?
-- now() returns date + time, curdate() returns only current date.

-- how does datediff work?
-- returns number of days between two dates.

-- what is interval?
-- keyword used to add or subtract time units from a date.

-- how to calculate last 30 days?
-- where order_date >= curdate() - interval 30 day;

-- can we group by month only?
-- yes, using month(date_column).

-- why year & month grouped together?
-- to avoid mixing same months from different years.

-- what is recency analysis?
-- analysis of how recently a customer made a purchase.

-- date functions in analytics?
-- used for trend analysis, period comparison, cohort analysis, and time-based filtering.

-- common date mistakes in sql?
-- ignoring time part, wrong format, timezone issues, incorrect grouping by month.

--                               QUERY ( PART 12 ) 

-- 1) extract year from orders ? 
select year(order_date ) as order_year from orders ; 

-- 2) extract month from orders ?
select month(order_date) as order_month from orders ; 

-- 3) show today's date ?
select curdate() ; 

-- 4) add 10 days to order date ?
select order_date , date_add(order_date , interval 10 day) as new_date from orders ; 

-- 5) find orders from last 15 days ?
select * from orders where order_date >= curdate() - interval 15 day ; 

-- 6) calculate days since each order ?
select order_id , datediff(curdate() , order_date ) as days_since_orders from orders ; 

-- 7) count orders per month ?
select year(order_date) as yr , month(order_date) as mon , count(*) as total_orders 
from orders 
group by year(order_date) , month(order_date) ; 

-- 8) find oldest order ?
select * from orders order by order_date asc limit 1 ;

-- 9) find most recent order ?
select * from orders order by order_date desc limit 1 ;

-- 10) calculate average delivery days ?
select round(avg(d.shipment_days),2) as avg_delivery_days
from delivery d ; 

-- 11) show orders in january ?
 select * from orders where month(order_date) = 1 ;
 
 -- 12) find orders placed this year ?
 select * from orders 
 where year(order_date) = year(curdate()) ; 
 
 --                                          MINI PROJECT (1) 
 
 -- 1) orders per month ?
 select month(order_date) as month ,
 count(*) as total_orders 
 from orders 
 group by month(order_date)
 order by month ;
 
 -- 2) latest month sales ?
 
 
 
 -- 3) growth trend ?
 
 
 
 --                                  MINI PROJECT (2) 
 
 -- 1) average delivery days ?
 select 
 round(avg(shipment_days),2) as avg_delivery_days
 from delivery ; 
 
 -- 2) fast vs slow deliveries ?
 select count(*) as fast_deliveries
 from delivery
 where shipment_days <= 3 ;
 
 select count(*) as slow_deliveries
 from delivery 
 where shipment_days > 3 ;
 
 -- 3) delay classification ?
 select *from delivery 
 where shipment_days <=2 ;
 
 select * from delivery 
 where shipment_days between 3 and 5 ;
 
 select * from delivery 
 where shipment_days >5 ;  
 
 --                                     MINI PROJECT (3) 
 
 -- 1) days since last order ?
 
 
 
 --                                     THEORY QUESTIONS ( PART 13 ) 
 
 -- 1) what is concat?
-- it combines two or more strings into one .

-- 2) difference between upper and lower ?
-- upper converts text to uppercase, lower converts text to lowercase .

-- 3) what does length return?
-- it returns number of characters in a string .

-- 4) what is substring?
-- it extracts part of a string from a given position .

-- 5) difference between left and substring ?
-- left extracts fixed number of characters from start, substring extracts from any position .

-- 6) purpose of replace ?
-- it replaces specific text with new text in a string .

-- 7) what does trim do?
-- it removes leading and trailing spaces .

-- 8) how to extract email domain?
-- it extracts part after @ from email .

-- 9) why clean text before analysis?
-- it improves data quality and accuracy .

-- 10) case sensitivity in sql?
-- it depends on database collation and settings .

-- 11) can multiple string functions be nested?
-- yes multiple string functions can be combined .

-- 12) real-world use case of string cleaning?
-- standardize names emails and addresses for analysis .

--                                       QUERY ( PART 13 ) 

-- 1) concatenate name and email ?
select concat(name, ' - ' , email_address ) as name_email 
from customers ; 

-- 2) convert all product names to uppercase ?
select upper(product_name) as name_upper
from product ; 

-- 3) extract first 4 letters of product name ?
select substring( product_name , 1, 4) as first_four
from product ; 

-- 4) extract last 3 letters ?
select right ( product_name , 3 ) as last_three
from product ; 

-- 5) replace cod with cash ?
select replace(payment_method , ' cash on delivery ' , ' cash ' ) as method_update 
from orders ; 

-- 6) trim spaces from names ?
select trim(name) as trimmed_name 
from customers ; 

 -- 7) count length of seller name ?
 select length(name) as name_length 
 from seller ; 
 
 -- 8) extract email domain ?
 select substring_index(email_address , '@' , -1 ) as eamil_domain 
 from customers ; 
 
  -- 9) create short product code ?
  select concat(left( product_name , 3) , product_id ) as short_code
  from product ; 
  
  -- 10) combine category + price ?
  select concat(category , '-' , 'price' ) as category_price 
  from product ; 
  
  -- 11) standardize payment method to lowercase ?
  select lower(payment_method) as lower_words
  from orders ; 
  
  -- 12) format name properly ?
  select concat(upper(left(name , 1)) , 
  lower(substring(name,2))) as format_name 
  from customers ; 
  
  --                                            MINI PROJECT (1) 
  
  -- 1) standardsize names ?
  select concat(upper(left(name , 1)) , 
  lower(substring(name,2))) as format_name 
  from customers ; 
  
  -- 2) extract email domain ?
  select substring_index(email_address , '@' , -1 ) as eamil_domain 
 from customers ; 
 
 -- 3) remove extra spaces ?
 select trim(name) as trimmed_name 
from customers ; 

--                                               MINI PROJECT(2) 

-- 1) generate short code using first 3 letters+price ?
select concat(left( product_name , 3) , price ) as short_code
  from product ; 
  
  --                                            MINI PROJECT (3 )
  
  
  
  
  
  
  --                                              THEORY QUESTIONS ( PART 14 ) 
  
  -- 1) what is case when ?
-- case when is a conditional expression in sql used to apply if else logic inside queries.

-- 2) difference between if and case ?
-- if handles simple conditions while case handles multiple conditions and is more flexible.

-- 3) is else mandatory ?
-- no else is optional and if not provided it returns null.

-- 4) can case be used with aggregates?
-- yes case can be used inside sum count avg etc for conditional aggregation .

-- 5) can case be used in order by ?
-- yes case can control custom sorting logic in order by .

-- 6) can case be nested ?
-- yes case can be written inside another case.

-- 7) how does sql evaluate case ?
-- sql checks conditions from top to bottom and stops at the first true condition.

-- 8) case vs where difference?
-- where filters rows while case changes values inside result columns.

-- 9) when to use case ?
-- use case when conditional logic is needed inside select group by order by.

-- 10) can case return null ?
-- yes if no condition matches and else is not given.

-- 11) performance impact of case ?
-- case has minimal impact but complex logic can slow large queries.

-- 12) real world business uses of case ?
-- used for customer segmentation and filter large database. 

--                                    QUERY ( PART 14 ) 

-- 1) classify products by price ?
select product_id , price ,
case 
when price < 100 then'low'
when price between 100 and 350 then 'moderate'
else 'high' 
end as price_category
from product ; 

-- 2) segment customers by order count ?
select 
     name,
    total_orders,
    case 
		when total_orders >=2 then "regular customer"
        when total_orders = 1 then "normal "
        else "inactive customer"
	end as customer_type
from (
	select
     c.name,
     count(o.order_id) as total_orders
	from customers c
    left join orders o
    on c.customer_id = o.customer_id
    group by c.customer_id 
    ) t;
    
    -- 3) identify slow and fast deliveries ?
    select order_id , shipment_days ,
    case
    when shipment_days <= 2 then 'fast'
    when shipment_days between 3 and 5 then ' normal' 
    else 'slow' 
    end as delivery_speed
    from delivery ; 
    
    -- 4) count delivered vs non delivered orders ?
     select 
	sum(case when order_status = " fulfilled " then 1 else 0 end) as delivered_order,
    sum(case when order_status <> " fulfilled " then 1 else 0 end) as non_delivered
from orders ; 

-- 5) categorize sellers by rating ?
select seller_id , ratings ,
case
   when ratings >= 4.5 then 'excellent'
   when ratings between 3 and 4 then ' good '
   else ' poor '
   end as seller_category 
   from seller ;
   
-- 6) classify inventory status ?
   select product_id , stock , 
      case
        when stock = 0 then ' out of stock '
        when stock between 1 and 50 then ' low stock '
        else ' in stock '
        end as inventory_status 
	from product ;
    
-- 7) use case in order by ?
     select * from orders
     order by
     case
        when order_status = ' pending ' then 1 
        else 2 
        end ;
        
-- 8) use case with window function ?
    select order_id , amount ,
    case
      when rank() over ( order by amount desc ) <= 5 then ' top 5 '
      else 'others' 
      end as order_rank
      from orders ;
      
-- 9) segment orders by payment type ?
    select order_id , payment_method ,
    case
       when payment_method = ' upi ' then ' online '
       when payment_method = ' net banking ' then ' cards'
       when payment_method = ' cash on delivery ' then ' cash'
       else ' others'
       end as payment_segment 
       from orders ;
       
-- 10) create revenue band categories ?
-- select order_id, amount,
-- case
  
  
-- 11) nested case example ?
select product_id , price ,
case 
when price < 100 then'low'
when price between 100 and 350 then 'moderate'
else 'high' 
end as price_category
from product ; 

-- 12) classify customers by email domain ?
select customer_id , email_address ,
case
  when email_address like ' %@gmail.com ' then 'gmail'
  when email_address like ' %@yahoo.com ' then ' yahoo'
  else 'other'
  end as domain_type
  from customers ;
  
--                               MINI PROJECT (1)

-- 1) segment into inactive occasional and frequent ?
select c.customer_id , 
count( o.order_id ) as total_orders ,
case 
  when count(o.order_id) = 0 then 'inactive'
  when count(o.order_id) between 1 and 5 then 'occasional'
  else' frequent' 
  end as customer_segment 
  from customers c
  left join orders o 
  on c.customer_id = o.customer_id 
  group by c.customer_id ;
  
  -- 2) create summary report ?
  
  
--                                    MINI PROJECT (2) 

-- 1) low ,medium , and high price ?
select product_id , price ,
case 
when price < 100 then'low'
when price between 100 and 350 then 'medium'
else 'high' 
end as price_category
from product ; 

-- 2) compare vs category average ?
select product_id,
       price ,
       avg(price) over() as overall_avg ,
case
   when price > avg(price) over () then ' above average '
   when price < avg(price) over() then ' below average '
   else ' equal to average ' 
   end as price_comparison 
   from product ;
   
--                                      MINI PROJECT (3) 

-- 1) classify delivery partners ?
select order_id , service_partner , shipment_days,
    case
    when shipment_days <= 2 then 'fast'
    when shipment_days between 3 and 5 then ' average ' 
    else 'slow' 
    end as partner_category 
    from delivery ; 
    
-- 2) rank performance by delivery performance ?
select service_partner , shipment_days , 
rank () over (order by shipment_days) as performance_rank
from delivery ;

--                                     MINI PROJECT(4) 

-- 1) identify out of stock ?
select 
product_id , stock ,
  case 
   when stock = 0 then ' out_of_stock '
   else ' in_stock'
   end as stock_status
   from product ;
   
-- 2) identify high demand items ?


  
--                                THEORY QUESTIONS ( PART 15 ) 

-- 1) What is a view ?
-- A view is a virtual table created from a SQL query. It shows data from one or more tables.

-- 2) Difference between view and table ?
-- A table stores actual data in the database. A view only displays data from tables using a query.

-- 3) Does view store data ?
-- No, A normal view does not store data and fetches data from the base tables.

-- 4) Can we insert into view ?
-- Yes, but only in simple views based on a single table without joins or aggregations.

-- 5) What happens when base table updates ?
-- The view automatically shows the updated data because it reads from the base table.

-- 6) Can views be indexed ?
-- Normal views cannot be indexed. Some databases support indexed or materialized views.

-- 7) Why use views in dashboards ?
-- Views simplify complex queries and provide consistent data for reports and dashboards.

-- 8) What is materialized view ? 
-- A materialized view stores the query result physically in the database for faster performance.

-- 9) Security benefits of views ?
-- Views can hide sensitive columns and restrict users to specific data.

-- 10) Can view contain joins ?
-- Yes, Views can include joins between multiple tables. 

-- 11) View vs CTE difference ?
-- A view is stored in the database for reuse. A CTE exists only during a single query execution.

-- 12) When should views be avoided ?
-- Views should be avoided when queries become very complex or cause performance issues.
   
--                                   QUERY ( PART 15) 

-- 1)   create customer summary view ?
create view customer_summary as 
select customer_id, count(order_id) as total_orders 
from orders
group by customer_id ;

select * from customer_summary ;

-- 2) create delivered orders view ?
create view delivered_orders as
select * from orders
where order_status =' fulfilled ' or ' delivered ' ;

select * from delivered_orders;

-- 3) modify view using replace ?
create or replace view delivered_orders as
select * from orders
where order_status =' fulfilled ' or ' delivered ' ;

-- 4) drop view ?
drop view delivered_orders ;

-- 5) create view hiding sensitive columns ?


-- 6) create view using join ?
create view order_deatils as 
select o.order_id ,c.name, o.order_status
from orders o 
join customers c 
on o.customer_id =c.customer_id ;

-- 7) create view using group by ?
create view customer_summary as 
select customer_id, count(order_id) as total_orders 
from orders
group by customer_id ;

-- 8) use view in another query ?


-- 9) count records from view ?
select count(*) 
from customer_summary ;

-- 10) compare performance of table vs view ?
select * from orders;
select * from customer_summary ;


--                               MINI PROJECT(1)

-- 1) customer summary view ?
 create view customer_summary as 
select customer_id, count(order_id) as total_orders 
from orders
group by customer_id ;

-- 2) delivery performance view ?
create view delivery_performance as 
select service_partner ,
count(order_id) as total_deliveries,
avg(shipment_days) as avg_delivery_days
from delivery
group by service_partner ;

--                           MINI PROJECT(2) 

-- 1) executive dashboard view ?
create view executive_dashboard as 
select 
o.order_id ,
c.customer_id,
c.name,
o.order_date
from orders o
join customers c
on o.customer_id = c.customer_id ;

--                         MINI PROJECT (3)

-- 1) KPI view layer ?



--                         THEORY QUESTIONS ( PART 16) 

-- 1) What is an index?
-- Index is a database object that improves the speed of data retrieval from a table.

-- 2) How does indexing improve performance?
-- Index allows the database to find rows quickly without scanning the entire table.

-- 3) What is full table scan?
-- Full table scan means the database reads every row of the table to find matching data.

-- 4) Types of indexes in MySQL?
-- Primary key, unique index, index (normal), fulltext index, and spatial index.

-- 5) What is composite index?
-- Composite index is an index created on two or more columns of a table.

-- 6) When should we avoid index?
-- Avoid index on very small tables or columns that change frequently.

-- 7) What does EXPLAIN show?
-- Explain shows how MySQL executes a query and whether indexes are used.

-- 8) Difference between UNIQUE and PRIMARY KEY?
-- Unique allows one null value while primary key does not allow null and uniquely identifies each row.

-- 9) Can too many indexes slow performance?
-- Yes too many indexes can slow down insert update and delete operations.

-- 10) How does index affect INSERT?
-- Insert becomes slower because the database must update the index along with the table data.

-- 11) Index vs partitioning difference?
-- Index speeds up data search while partitioning divides large tables into smaller parts.

-- 12) Real-world optimization scenario?
-- Adding index on order_date column helps an ecommerce system quickly find recent orders.

--                                  QUERY ( PART 16 ) 

-- 1) create index on order_date ?
create index idx_order_date
on orders(order_date) ;

-- 2) create index on customer_id ?
create index idx_customer_id 
on orders(customer_id) ;

-- 3) create composite index ?
create index idx_customer_date
on orders(customer_id ,order_date ) ;

-- 4) drop an index ?
drop index idx_customer_id
on orders ;

-- 5) use explain on select query ?


-- 6) compare query before and after index ?


-- 7) optimize date filtering query ?
select * from orders
where order_date between ' 2026-01-01 ' and ' 2026-02-25 ';

-- 8) identify full table scan ?


-- 9) optimize join query ?
select c.name, o.order_id ,o.order_date
from customers c
join orders o
on c.customer_id = o.customer_id ;

-- 10) test order by performance ?
select * from orders 
order by order_date ;

-- 11) show indexes of table ?
show index from orders ;

-- 12) remove unnecessary index ?
drop index idx_customer_date
on orders ;

--                                      MINI PROJECT (1) 

-- 1) replace year() filtering ?
select * 
from orders
where order_date between ' 2026-01-01 ' and ' 2026-02-25 ';

-- 2) improve performance ?
create index idx_order_date
on orders(order_date) ;

--                                      MINI PROJECT (3) 

-- 1) orders table ?
create index idx_orders_customer
on orders (customer_id) ;

create index idx_order_date 
on orders (order_date) ;

-- 2) products table ?
create index idx_products_category
on products(category) ;

create index idx_products_price
on products ( price) ;

-- 3) delivery table ?
create index idx_deliveries_order
on delivery(order_id) ;

create index idx_deliveries_status
on delivery(status) ;

--                                   THEORY QUESTIONS ( PART 17 )

-- 1) What is a stored procedure?
-- A stored procedure is a prewritten sql program stored in the database that can be executed when needed.

-- 2) Benefits of stored procedures?
-- Stored procedures improve performance, reduce repeated code, and increase security.

-- 3) What is delimiter?
-- Delimiter is used to change the default statement ending symbol in mysql so multiple statements can be written.

-- 4) In vs out parameters?
-- In parameters pass values into a procedure while out parameters return values from a procedure.

-- 5) Procedure vs function difference?
-- A procedure performs operations and may not return a value while a function always returns a single value.

-- 6) What is a trigger?
-- A trigger is a database program that automatically executes when insert update or delete occurs on a table.

-- 7) Types of triggers?
-- Common types are insert trigger update trigger and delete trigger.

-- 8) Before vs after trigger?
-- A before trigger runs before the data change while an after trigger runs after the change happens.

-- 9) What are new and old?
-- New refers to the new row value after change while old refers to the previous row value before change.

-- 10) Can trigger return value?
-- No trigger cannot return values because it runs automatically inside the database.

-- 11) Trigger vs procedure?
-- A trigger runs automatically when an event occurs while a procedure runs only when called.

-- 12) Are triggers automatically executed?
-- Yes triggers execute automatically when the defined database event occurs.

-- 13) Can we disable trigger?
-- In mysql triggers cannot be directly disabled they must be dropped if not needed.

-- 14) Performance impact of triggers?
-- Triggers may slightly slow operations because extra actions run automatically.

-- 15) Real world use case of triggers?
-- Triggers are used for audit logging automatic updates and tracking data changes.

--                                        QUERY ( PART 17 ) 

-- 1) create procedure for delivered orders ?
delimiter //
create procedure get_delivered_orders()
begin 
   select * from orders
   where order_status = " fulfilled ";
   end //
   delimiter ;
   
-- 2) create procedure with parameters ?
delimiter //
create procedure get_orders_by_status(in order_status varchar(20))
begin
select * from orders
where status = order_status;
end //
delimiter ;

-- 3) create procedure without parameter ?
delimiter //
create procedure get_delivered_orders()
begin 
   select * from orders
   where order_status = " fulfilled ";
   end //
   delimiter ;
   
-- 4) use if in procedure ? 
DELIMITER //
create procedure order_by_status(in p_status varchar(50))
begin
select*from orders
where order_status = p.status;
end //
DELIMITER ;

-- 5) Create procedure with OUT parameter
 
DELIMITER // 
create procedure get_order(out total int)
begin 
select count(*) into total 
from ordes;
end //
DELIMITER ;

call get_order ( @ total);
select @ total; 

-- 6) -- Create DELETE trigger
use bigbasket ;
delimiter //
create trigger before_order_delete
before delete on orders
for each row 
begin
 if old.order_status = "delivered" 
  then signal sqlstate "45000"
  set message_text = "Delivered orders can not be modify";
end if;
end//
delimiter ;

-- 7) Use NEW keyword
-- drop trigger before_order_update;

create trigger before_order_update
before update on orders
for each row
set new.order_status = "pending";

-- Use OLD keyword

delimiter //
create trigger check_status_change
before update on orders
for each row
begin
if old.order_status = "delivered" 
  then signal sqlstate "45000"
  set message_text = "Delivered orders can not be modify";
end if;
end //
delimiter ;

-- Create validation trigger
delimiter //
create trigger before_order_delete
before delete on orders
for each row 
begin
 if old.order_status = "delivered" 
  then signal sqlstate "45000"
  set message_text = "Delivered orders can not be modify";
end if;
end//
delimiter ;

-- Create logging trigger

create table users (user_id int primary key auto_increment,
                   user_name varchar(50), password varchar(50)); 
                   
--                          MINI PROJECT 1

-- 1) Procedure to insert order         
	-- procedure thi order insert karshu
    
    delimiter //
    create procedure add_order( in p_customer_id int,
                                in p_product_name varchar(100),
                                in p_stock int)
    begin
    insert into orders (customer_id,product_name,stock)values
                       (p.customer_id,p.product_name,p.stock);
     end //
     delimiter ;
     
     call add_order (1,"pizza",2);
                 
                 
    -- Trigger to log activity
    
    
    create table order_log(log_id int auto_increment primary key,
                            order_id int,
                            action varchar(100),
                            log_time timestamp default current_timestamp);
    delimiter //
    create trigger after_order_insert
    after insert on orders
    for each row
    begin
    insert into order_log(order_id, action)
    values (new.order_id, "order created");
    end // 
    delimiter ;
    
drop trigger after_order_insert;         

--                                   Mini Project 2

-- 1)Prevent negative stock
-- 2) Log stock changes


delimiter //
create trigger prevent_negative_stock
before update on product
for each row
begin
if new.stock < 0 then
signal sqlstate "45000"
set message_text = "stock cannot be negative";
end if ;
end //
delimiter ;

insert into product(product_name,price,category,stock)values
                    ("fridge",15000,"electeonics",5);
update product set stock = -8
where product_id =1 ;

-- Mini Project 3: Audit & Compliance System

create table customer_audit(
                   audit_id int primary key auto_increment,
                   customer_id int,
                   action_type varchar(10),
                   old_data text,
                   new_data text,
                   action_time datetime default current_timestamp);

-- Log every insert/update/delete

-- insert trigger
drop trigger cust_after_insert;
delimiter //
create trigger cust_after_insert
after insert on customers
for each row
begin
insert into customer_audit(customer_id,action_type,new_data) values
                   (new.customer_id,"insert",concat("name",new.name,
                                                    "mobile_no",new.phone,
                                                    "email",new.email_address,
                                                    "address",new.address));
  end//
  delimiter ;
  
  insert into customers(name,phone,email_address ,address)values
                       ("pooja shah","7980656476","pooja@gmail.com","noida");

select*from customers;

-- update
update customers set address = "rajkot" where customer_id =1; 

-- delete
delete from customers where customers_id =1 ;

--                                        TRIGGER PRACTICAL

-- Create a BEFORE INSERT trigger on customers that prevents insertion 
-- if the email does not contain “@” and raise an error using SIGNAL.
 
 use bigbasket ;
 delimiter //
 create trigger before_insert_cust
before insert on customers
for each row
begin 
if new.email_address not like "%@%" then
signal sqlstate "45000"
set message_text = "Please enter valid email address";
end if;
end //
delimiter ;

-- Create a BEFORE INSERT trigger on reviews that automatically sets review_date 
-- to CURRENT_DATE if it is inserted as NULL.


delimiter //
create trigger before_insert_review
before insert on reviews
for each row
begin
if review_date is null then 
set new.review_date = current_date();
end if;
end //
delimiter ;

-- Create a BEFORE INSERT trigger on deliveries that ensures delivery_days cannot be greater than 30; 
-- if greater, set it to 30.


delimiter //
create trigger before_insert_deliveries
before insert on delivery
for each row
begin
if new.shipment_days > 30 then
set new.shipment_days = 30;
end if;
end //
delimiter ;

 insert into delivery (shipment_days) values(50);
 select*from delivery;

-- Create an AFTER INSERT trigger on reviews that inserts a record 
-- into a new table review_log(review_id, product_id, log_time) whenever a new review is added.

create table review_log(review_id int auto_increment primary key,
                       product_id int,
                       log_time datetime default current_timestamp);
                       
delimiter //    
 create trigger after_insert_review
after insert on reviews
for each row
begin  
insert into review_log(review_id,product_id,log_time)values
                       (new.review_id,new.product_id,now());
end //
delimiter ;

insert into review_log (review_id,product_id,log_time)values
                       (21,11,now());
drop trigger after_insert_review;
select*from review_log;
select*from reviews;

-- Create an AFTER INSERT trigger on customers that inserts a welcome record into a table
-- customer_activity(customer_id, activity_type, activity_time) with activity_type = 'New Signup'.

create table customer_activity(customer_id int auto_increment primary key,
                              activity_type varchar(50),                             
                              activity_time datetime default current_timestamp);

delimiter //
create trigger customer_activity_trigger
after insert on customers
for each row
begin
insert into customer_activity(customer_id, activity_type, activity_time) values
							(new.customer_id,"new signup",now());
end //
delimiter ;

insert into customer_activity(customer_id,activity_type,activity_time)values
                       (67,"new signup",now());
                            
select*from customer_activity;

-- Create an AFTER INSERT trigger on products that inserts a row into 
-- inventory_log(product_id, stock_added, log_time) recording the initial stock value.


create table inventory_log(product_id int auto_increment primary key,
                            stock_added int,
                            log_time datetime default current_timestamp);

delimiter //
create trigger inventory_log 
after insert on product
for each row
begin

insert into inventory_log (product_id ,stock_added, log_time )values
                          (new.product_id,"insert",now());
end //
delimiter ;

insert into inventory_log (product_id ,stock_added)values
                       (23,5);
                            
select*from inventory_log;

-- Create a BEFORE UPDATE trigger on deliveries that prevents updating 
-- delivery_status to 'Delivered' if delivery_days is NULL.

delimiter // 
create trigger before_updating_deliveries
before update on delivery
for each row
begin
if new.shipment_days is null then
 set new.delivery_status = "delivered";
end if;
end //
delimiter ;

-- Create a BEFORE UPDATE trigger on customers that blocks updating 
-- the mobile_no if the new number already exists in another customer record.

DROP TRIGGER IF EXISTS before_updating_cust;
DELIMITER //

CREATE TRIGGER before_updating_cust
BEFORE UPDATE ON customers
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM customers 
        WHERE phone = NEW.phone
          AND customer_id <> OLD.customer_id
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Mobile number already exists';
    END IF;
END//

DELIMITER ;

-- Create a BEFORE UPDATE trigger on products that prevents
-- reducing stock by more than 50 units in a single update operation.

delimiter //
create trigger before_update_product
before update on product
for each row
begin
if(old.stock-new.stock)> 50 then signal sqlstate "45000"
 set message_text = "cannot reduce stock by more than 50 units in a singal update";
 end if;
 end //
 delimiter ;
end //
delimiter ;

-- Create an AFTER UPDATE trigger on deliveries that logs changes of delivery_partner into 
-- a table delivery_partner_change(order_id, old_partner, new_partner, change_time).

delimiter //
create trigger after_update_deliveries 
after update on delivery
for each row
begin
if old.shipment_partner <> new.shipment_partner then 
              insert into delivery_partner_change (order_id, old_partner, new_partner, change_time)values
              (old.order_id,old.shipment_partner,new.delivery_partner,now());
end if;              
end //
delimiter ;

-- Create an AFTER UPDATE trigger on customers that 
-- logs address changes into customer_address_log(customer_id, old_address, new_address, change_time).

delimiter //
create trigger after_update_customers
after update on customers
for each row
begin
if old.address <> new.address then 
              insert into customer_address_log(customer_id, old_address, new_address, change_time)values
              (old.customer_id,old.address,new.address,now());
end if;              
end //
delimiter ;

update customers
set address = "vatava"
where customer_id = 57 ;

select*from customers;

-- Create an AFTER UPDATE trigger on products that 
-- logs price changes into price_change_log(product_id, old_price, new_price, change_time) only if price actually changed.

delimiter //
create trigger after_update_products
after update on product
for each row
begin
if old.price <> new.price then 
              insert into price_change_log(product_id, old_price, new_price, change_time)values
              (old.product_id,old.price,new.price,now());
end if;              
end //
delimiter ;

-- Create a BEFORE DELETE trigger on customers that 
-- prevents deletion if the customer has any records in orders.


delimiter //
create trigger before_delete_cust
before delete on customers
for each row
begin
declare order_count int ;
 select count(*) into order_count
 from orders
 where customer_id = old.customer_id;
 if order_count > 0 then signal sqlstate "45000"
 set message_text = "cannot delete customers:orders exist.";
 end if ;
 end // 
delimiter ;

select*from customers;

insert ignore into customers (name,phone,email_address,address)values
                      ("Tejul patel ","7656789387","tejul@gmail.com","rajkot");
                      
insert into orders( customer_id ,order_date)values
                 (last_insert_id(),now());


-- Create a BEFORE DELETE trigger on products that 
-- prevents deletion if the product stock is greater than 0.

delimiter //
create trigger before_products_delete
before delete on product
for each row
begin

if old.stock > 0 then 
signal sqlstate "45000"
set message_text = "cannot delete product because stock is greater than 0";
end if ;
end //
delimiter ; 

-- Create a BEFORE DELETE trigger on deliveries that prevents deletion if delivery_status = 'In Transit'.

delimiter //
create trigger before_delete_deliveries
before delete on delivery
for each row 
begin
 if old.order_status  = "in transit" then 
  signal sqlstate "45000"
set message_text = "cannot delete delivery because it is currently in transit";
end if;
end //
delimiter ;

-- Create an AFTER DELETE trigger on reviews that inserts deleted review details into 
-- deleted_reviews_log(review_id, product_id, customer_id, deleted_time).

create table deleted_reviews_log
        (review_id int, 
        product_id int, 
		deleted_time timestamp);
        
        
   delimiter //
   create trigger after_reviews_delete
   after delete on reviews
   for each row
   begin
   insert into deleted_reviews_log(review_id, product_id, deleted_time)values
                                 (old.Review_id,old.product_id,now());
	end //
    delimiter ;

-- Create an AFTER DELETE trigger on products that inserts deleted product information into 
-- product_archive(product_id, product_name, deleted_time).


create table product_achive (product_id int,
                              product_name varchar(50),
                              deleted_time timestamp );
                              
delimiter //
create trigger after_delete_products
after delete on product
for each row
begin
insert into product_achive (product_id, product_name, deleted_time)values
                            (old.product_id,old.product_name,now());
 end //
 delimiter ;






    



      
	
	


  





 
 
 

    
 
 
 






  
  
  

  
  





 





 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 









  
  
  
  
  
  
  
  
  