
SET @year := 2021;

SELECT
  cs.sales_channel,
  SUM(cs.amount) AS revenue
FROM clinic_sales cs
WHERE YEAR(cs.datetime) = @year
GROUP BY cs.sales_channel
ORDER BY revenue DESC;
