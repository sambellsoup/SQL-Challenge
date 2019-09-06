select
    date_trunc('hour', created_at) time_ordered,
    (sum(total_price) - sum(total_tax)) revenue,
    count(order_id) total_orders,
    (count(customer_id) - count(distinct customer_id)) as repeat_customers
FROM public.orders
GROUP BY repeat_customers, time_ordered
ORDER BY time_ordered;