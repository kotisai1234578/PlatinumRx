SET @year := 2021;

SELECT
  c.uid,
  c.name,
  c.mobile,
  SUM(cs.amount) AS total_spent
FROM clinic_sales cs
JOIN customer c ON cs.uid = c.uid
WHERE YEAR(cs.datetime) = @year
GROUP BY c.uid, c.name, c.mobile
ORDER BY total_spent DESC
LIMIT 10;