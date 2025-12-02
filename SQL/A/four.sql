WITH monthly AS (
  SELECT YEAR(bc.bill_date) AS yr,
         MONTH(bc.bill_date) AS mon,
         bc.item_id,
         SUM(bc.item_quantity) AS total_qty
  FROM booking_commercials bc
  WHERE YEAR(bc.bill_date) = 2021
  GROUP BY yr, mon, bc.item_id
)
SELECT mon AS month,
       'MOST' AS which,
       m.item_id,
       m.total_qty
FROM monthly m
WHERE m.total_qty = (
  SELECT MAX(total_qty) FROM monthly m2 WHERE m2.mon = m.mon
)
UNION ALL
SELECT mon AS month,
       'LEAST' AS which,
       m.item_id,
       m.total_qty
FROM monthly m
WHERE m.total_qty = (
  SELECT MIN(total_qty) FROM monthly m2 WHERE m2.mon = m.mon
)
ORDER BY month, which DESC;
