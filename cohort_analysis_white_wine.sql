SELECT 
  DATE_TRUNC('month', sa_first.date) AS cohort_month,
  DATE_TRUNC('month', sa_orders.date) AS order_month,
  COUNT(DISTINCT sa_first.card_id) AS cohort_size
  /*COUNT(DISTINCT sa_orders.card_id) AS orders*/
FROM 
  sale_articles AS sa_first
JOIN 
  sale_articles AS sa_orders ON sa_first.card_id = sa_orders.card_id
WHERE 
  sa_first.lvl_5 LIKE '%бхмн аекне%' AND 
  sa_orders.lvl_5 LIKE '%бхмн аекне%' AND 
  sa_first.date = DATE_TRUNC('month', sa_first.date) AND 
  sa_orders.date = DATE_TRUNC('month', sa_orders.date) AND 
  sa_orders.date > sa_first.date
GROUP BY 
  1,2
ORDER BY 
  1,2;