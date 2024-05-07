select p.name, COUNT(pv.person_id) AS count_of_visits
from person_visits pv
join person p on pv.person_id = p.id
GROUP BY p.name
ORDER BY count_of_visits DESC, p.name
limit 4;