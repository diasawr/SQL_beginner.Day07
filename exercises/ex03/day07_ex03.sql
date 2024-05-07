WITH counts AS (
    SELECT pizzeria.name, COUNT(pv.id) AS visit_count,
           ROW_NUMBER() OVER (ORDER BY COUNT(pv.id) DESC) AS visit_r
    FROM  pizzeria
        JOIN person_visits pv ON pizzeria.id = pv.pizzeria_id
    GROUP BY        pizzeria.id),
    oCounts AS (
    SELECT pizzeria.name, COUNT(po.id) AS order_count,'order' AS action_type,
           ROW_NUMBER() OVER (ORDER BY COUNT(po.id) DESC) AS order_r
    FROM pizzeria
        JOIN menu m ON pizzeria.id = m.pizzeria_id
        JOIN person_order po ON m.id = po.menu_id
    GROUP BY        pizzeria.id)
SELECT counts.name, COALESCE(visit_count,0)+ COALESCE(order_count, 0) AS total_count
FROM
    counts
FULL JOIN oCounts ON counts.name = oCounts.name
ORDER BY
    total_count DESC,
    counts.name ASC;