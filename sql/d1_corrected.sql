select
  c.region,
  sum(o.amount) as revenue
  from customers as c
  join orders as o
  on c.customer_id=o.customer_id
  where lower(o.status) = 'completed'
  group by c.region
  having sum(o.amount) > 80000
  order by revenue desc;
