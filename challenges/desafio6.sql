SELECT 
MIN(plans.plan_value) AS faturamento_minimo,
MAX(plans.plan_value) AS faturamento_maximo,
ROUND(AVG(plans.plan_value), 2) AS faturamento_medio,
ROUND(SUM(plans.plan_value), 2) AS faturamento_total
FROM 
SpotifyClone.users AS users 
INNER JOIN SpotifyClone.plans AS plans 
ON users.plan_id = plans.plan_id;
