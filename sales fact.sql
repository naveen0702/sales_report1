use retail_db;

-- FIND NUMBER OF TRANSACTION INVOLVING MALE CUSTOMERS

select count(order_id)
from sales_fact s
inner join customer_info c
on
s.customer_id = c.customer_id
where gender = 'male';

-- number of customers ordered from more than one store

select count(customer_id)
from
	(select customer_id, count(distinct store_id) as store_count
    from sales_fact
    group by customer_id
    having count(distinct store_id) > 1) As a;
    
    -- city with the highest number of orders
    
    select city , order_count
    from
		( select city,count(distinct order_id) as order_count
        from sales_fact as fact
        inner join branch_info AS branch
        on fact.store_id = branch.store_id
        group by city
        order by count(distinct order_id) desc) AS a
	limit 1;
        
        -- output the area that recorded the highest sales in terms of sales amount, along with its sales amount
        
	SELECT area, sales
	from
        ( select area, sum(sale_price * quantity_ordered) as sales
        from sales_fact as fact
        inner join branch_info branch
        on fact.store_id = branch.store_id
        inner join order_product_mapping as map
        on fact.order_id = map.order_id
        inner join product_info as prod
        on map.product_id = prod.product_id
        group by area
        order by sum(sale_price * quantity_ordered) desc) AS a
	limit 1;
    
    -- find the state highest number of customers.
    
    select count(distinct customer_id) as count_customer, state
    from sales_fact as fact
    inner join branch_info as branch
    on fact.store_id = branch.store_id
    group by state
    order by count_customer desc
    limit 1;
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    
    
    
    
    
    
    