WITH counts AS (
    SELECT pizzeria.name, COUNT(pv.id) AS count,  'visit' AS action_type,
           ROW_NUMBER() OVER (ORDER BY COUNT(pv.id) DESC) AS visit_r
    FROM  pizzeria
        JOIN person_visits pv ON pizzeria.id = pv.pizzeria_id
    GROUP BY        pizzeria.id),
    oCounts AS (
    SELECT pizzeria.name, COUNT(po.id) AS count,'order' AS action_type,
           ROW_NUMBER() OVER (ORDER BY COUNT(po.id) DESC) AS order_r
    FROM pizzeria
        JOIN menu m ON pizzeria.id = m.pizzeria_id
        JOIN person_order po ON m.id = po.menu_id
    GROUP BY        pizzeria.id)
SELECT name,count,action_type
FROM counts
WHERE visit_r <= 3
UNION
SELECT name,count, action_type
FROM oCounts
WHERE order_r <= 3
ORDER BY 3 , 2  DESC