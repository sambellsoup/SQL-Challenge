select public.orders.customer_id,
       max(public.orders.created_at) as last_order_date,
      max(public.orders.created_at) + (lead(public.orders.created_at, 1) over(partition by public.orders.customer_id order by public.orders.created_at) - (max(public.orders.created_at))) as next_order_date
from public.orders
inner join
(select
customer_id, count(*)
from public.orders
where status  = 'fulfilled'
group by public.orders.customer_id
having count(customer_id) >1) repeat_customers
on public.orders.customer_id = repeat_customers.customer_id
group by public.orders.customer_id;




