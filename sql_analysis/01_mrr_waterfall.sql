-- MRR WaterFall
WITH monthly AS (
SELECT
  DATE_TRUNC('month', movement_date) AS month_date,
  STRFTIME(movement_date, '%Y-%m') AS month,
  SUM(CASE WHEN movement_type = 'New' THEN mrr_change ELSE 0 END) AS new_mrr,
  SUM(CASE WHEN movement_type = 'Expansion' THEN mrr_change ELSE 0 END) AS expansion_mrr,
  SUM(CASE WHEN movement_type = 'Contraction' THEN mrr_change ELSE 0 END) AS contraction_mrr,
  SUM(CASE WHEN movement_type = 'Churn' THEN mrr_change ELSE 0 END) AS churn_mrr
FROM mrr_movements
GROUP BY 1, 2
),

mrr_calc AS (
SELECT
  month_date,
  month,
  new_mrr,
  expansion_mrr,
  contraction_mrr,
  churn_mrr,
  (new_mrr + expansion_mrr + contraction_mrr + churn_mrr) AS net_new_mrr,
  SUM(new_mrr + expansion_mrr + contraction_mrr + churn_mrr)
            OVER (ORDER BY month_date) AS ending_mrr
FROM monthly
)

SELECT
  month,
  COALESCE(LAG(ending_mrr) OVER (ORDER BY month_date), 0) AS starting_mrr,
  new_mrr,
  expansion_mrr,
  contraction_mrr,
  churn_mrr,
  net_new_mrr,
  ending_mrr
FROM mrr_calc
ORDER BY month_date;

/*
New MRR declined nearly 90% from its May 2022 peak ($545K) to January 2024 ($56K). 
At the same time, churn remained elevated enough to reduce Net New MRR to just $852, 
showing that acquisition weakness and retention pressure are now compounding.
*/

