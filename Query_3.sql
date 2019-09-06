 with hours as (
    select generate_series('2018-12-28 00:00:00.000000'::date, '2019-03-15 14:00:00.000000'::date, '1 hour'::interval) as hour
                )
 select
    hours.hour,
    coalesce((sum(public.orders.total_price) - sum(public.orders.total_tax)), 0) revenue,
    coalesce(count(public.orders.closed_at), 0) total_orders,
   (count(public.orders.customer_id) - count(distinct public.orders.customer_id)) repeat_customers
from hours
left join public.orders on date_trunc('hour', public.orders.created_at) = hours.hour
group by 1;


/*
select
    date_trunc('hour', created_at) AS time_ordered,
    CASE WHEN closed_at is not null THEN (sum(total_price) - sum(total_tax)) ELSE 0 END AS revenue,
    CASE WHEN closed_at is not null THEN count(order_id) ELSE 0 END AS total_orders,
    CASE WHEN closed_at is not null THEN count(*) - count(distinct customer_id) ELSE 0 END AS repeat_customers

FROM public.orders
group by
ORDER BY time_ordered; */

