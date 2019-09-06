
select 'new_customer' as customer, sum(new_customer_revenue) as revenue_sum
from
(
  select sum(total_price)-sum(total_tax) as new_customer_revenue
  from public.orders
  group by customer_id
  having count(customer_id) = 1

) x
UNION ALL

select  'repeat_customer' as customer, sum(repeat_customer_revenue) as revenue_sum
from
(
  select sum(total_price)-sum(total_tax) as repeat_customer_revenue
  from public.orders
    group by customer_id
  having count(customer_id) > 1) y


