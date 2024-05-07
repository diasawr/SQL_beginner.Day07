SELECT
    p.address,
    ROUND(MAX(age::NUMERIC) - (MIN(age::NUMERIC) / MAX(age::NUMERIC)),2) AS formula,
    ROUND(AVG(p.age),2) AS average,
    CASE
        WHEN (MAX(p.age) - (MIN(p.age) / MAX(p.age))) > ROUND(AVG(p.age), 2) THEN 'true'
        ELSE 'false'
end as comparison
FROM
    person p
GROUP BY
    p.address
ORDER BY p.address;