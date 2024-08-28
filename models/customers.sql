with customers as (
    select  id,
            first_name,
            last_name
    from `dbt-tutorial`.jaffle_shop.customers

),


orders as(
    
    select  id,
            user_id,
            order_date,
            status
    from `dbt-tutorial`.jaffle_shop.orders
),

customers_orders as (

        SELECT 
            user_id,
            min(order_date) as first_order,
            max(Order_date) as most_recent_order,
            count(id) as number_of_orders
        from orders
        group by user_id

),
final as (

    SELECT 
        customers.id,
        customers.first_name,
        customers.last_name,
        customers_orders.first_order,
        customers_orders.most_recent_order,
        customers_orders.number_of_orders
    FROM customers
    left join  customers_orders
    on customers.id = customers_orders.user_id
)

SELECT * from final