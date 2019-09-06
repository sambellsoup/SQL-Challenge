-- This shows the highest number of incomplete orders by hour

-- A null value in closed_at is our indicator of a non-order

select
    date_trunc('hour', created_at) time_ordered,
    count(*)  as incompleted_orders
FROM public.orders
WHERE closed_at is null
group by time_ordered
order by incompleted_orders desc;


