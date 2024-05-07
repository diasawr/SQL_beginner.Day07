select pizzeria.name, count(po.id) as count_of_orders, ROUND(avg(m.price), 2) as average_price,
       max(m.price) as max_price, min(m.price) as min_price
from pizzeria
join menu m on pizzeria.id = m.pizzeria_id
join person_order po on m.id = po.menu_id
group by pizzeria.name
order by 1;