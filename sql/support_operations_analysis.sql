-- Customer Support Operations Analysis (SQLite-compatible)
SELECT strftime('%Y-%m',created_at) AS month, COUNT(*) AS tickets,
ROUND(AVG(resolution_hours),2) AS avg_resolution_hours,
ROUND(100.0*AVG(sla_met),1) AS sla_met_pct,
ROUND(100.0*AVG(escalated),1) AS escalation_pct,
ROUND(AVG(csat_score),2) AS avg_csat
FROM tickets GROUP BY 1 ORDER BY 1;

SELECT c.issue_category, COUNT(*) AS tickets,
ROUND(AVG(t.resolution_hours),2) AS avg_resolution_hours,
ROUND(100.0*AVG(t.sla_met),1) AS sla_met_pct,
ROUND(100.0*AVG(t.escalated),1) AS escalation_pct,
ROUND(AVG(t.csat_score),2) AS avg_csat
FROM tickets t JOIN categories c ON t.category_id=c.category_id
GROUP BY 1 ORDER BY tickets DESC;

WITH agent_performance AS (
 SELECT a.agent_id,a.agent_name,a.team,a.experience_level,COUNT(*) AS tickets,
 AVG(t.resolution_hours) AS avg_resolution_hours,
 100.0*AVG(t.sla_met) AS sla_met_pct,AVG(t.csat_score) AS avg_csat
 FROM tickets t JOIN agents a ON t.agent_id=a.agent_id
 GROUP BY 1,2,3,4
)
SELECT * FROM agent_performance ORDER BY tickets DESC;

SELECT c.issue_category,SUM(t.escalated) AS escalated_tickets,
ROUND(100.0*SUM(t.escalated)/SUM(SUM(t.escalated)) OVER (),1) AS share_of_escalations_pct
FROM tickets t JOIN categories c ON t.category_id=c.category_id
GROUP BY 1 ORDER BY escalated_tickets DESC;

SELECT cu.segment,t.channel,COUNT(*) AS tickets,
ROUND(AVG(t.resolution_hours),2) AS avg_resolution_hours,
ROUND(100.0*AVG(t.sla_met),1) AS sla_met_pct,ROUND(AVG(t.csat_score),2) AS avg_csat
FROM tickets t JOIN customers cu ON t.customer_id=cu.customer_id
GROUP BY 1,2 ORDER BY 1,tickets DESC;
