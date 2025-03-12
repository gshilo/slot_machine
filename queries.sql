-- These queries are only an example,
-- Before running change 'US' to your actual region.
-- Also change the begin and end times to the actual timeframe you want to examine.

First query (save in in file named bytes.cv):

SELECT
  SUM(total_bytes_billed/1024/1024/1024/1024) AS total_tb_billed,
  SUM(total_bytes_billed/1024/1024/1024/1024)*6.25 as cost_usd,
  project_id
FROM region-US.INFORMATION_SCHEMA.JOBS_BY_ORGANIZATION
WHERE
  creation_time BETWEEN CAST("2025-02-17" AS TIMESTAMP)
  AND CAST("2025-02-24" AS TIMESTAMP) group by project_id;


Second query (Save it in file named slots.csv):

SELECT
  period_start,
  project_id,
  count (distinct job_id) as total_queries,
  SUM(period_slot_ms/1000) AS total_slot_ms,
FROM
  region-US.INFORMATION_SCHEMA.JOBS_TIMELINE_BY_ORGANIZATION
WHERE
  period_start BETWEEN CAST("2025-02-17" AS TIMESTAMP)
  AND CAST("2025-02-24" AS TIMESTAMP)
GROUP BY
  period_start, project_id
ORDER BY
  period_start DESC;

Third query (Save it in file called jobs.csv):

SELECT
  jobs.project_id,
  timeline.job_id,
  timestamp_trunc(timeline.period_start, MINUTE) period_start,
  jobs.user_email,
  jobs.Job_type,
  CASE
    WHEN CONTAINS_SUBSTR(jobs.user_email, 'gserviceaccount') THEN 'background'
    ELSE 'foreground'
END
  AS query_type
FROM
    `region-US.INFORMATION_SCHEMA.JOBS_TIMELINE_BY_ORGANIZATION` AS timeline
  JOIN
    `region-US.INFORMATION_SCHEMA.JOBS_BY_ORGANIZATION` AS jobs
  ON
    timeline.job_id = jobs.job_id
WHERE
  timeline.period_start BETWEEN CAST("2025-02-17" AS TIMESTAMP)
  AND CAST("2025-02-24" AS TIMESTAMP);