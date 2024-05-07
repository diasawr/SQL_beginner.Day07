select p.address, p2.name, count(p2.name) AS count_of_orders
from person p
join person_order po  on po.person_id = p.id
JOIN menu m ON po.menu_id = m.id
JOIN pizzeria p2 on m.pizzeria_id = p2.id

GROUP BY p.address, p2.name
ORDER BY p.address, p2.name;
