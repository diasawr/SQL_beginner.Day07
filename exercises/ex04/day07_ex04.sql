Select person.name, COUNT(pv.person_id) AS count
from person
join person_visits pv on person.id = pv.person_id
where person_id = pv.person_id
group by person.name
HAVING
    COUNT(pv.person_id) > 3;