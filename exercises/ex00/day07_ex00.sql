select person_id, COUNT(pv.person_id) AS count_of_visits
from person_visits pv
GROUP BY person_id
ORDER BY count_of_visits DESC, pv.person_id ;
