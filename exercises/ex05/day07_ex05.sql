select DISTINCT  person.name
from person
join person_order po on person.id = po.person_id
order by person.name