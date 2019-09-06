select
    date_trunc('hour', created_at) time_ordered,
    count(*)  as incompleted_orders
FROM public.orders
WHERE closed_at is null
group by time_ordered
order by time_ordered