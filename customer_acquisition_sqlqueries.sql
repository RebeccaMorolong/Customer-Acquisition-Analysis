--cleaning customer acquisition data

--removing duplicates 

SELECT channel , cost , conversion_rate , revenue , COUNT(*)
FROM Customer_acquisition
GROUP BY channel , cost , conversion_rate , revenue
HAVING COUNT(*) <> 10 ;

DELETE FROM Customer_acquisition
WHERE id NOT IN (
	SELECT MIN(id)
	FROM Customer_acquisition
	GROUP BY channel , cost ,conversion_rate , revenue
);

--handling missing values
SELECT * FROM 
Customer_acquisition 
WHERE conversion_rate IS NULL ;



--calculate CPA, ROAS, and Acquisitions
--estimated the cost per customer acquired

SELECT
SUM(cost) / NULLIF(SUM(conversion_rate), 0) AS CPA
FROM Customer_acquisition;

--how much revenue was earned per rand spent
SELECT 
SUM(revenue) / NULLIF(SUM(cost), 0 ) AS ROAS 
FROM Customer_acquisition

-- approximation of total conversions

SELECT 
SUM(conversion_rate) AS Acquisition
FROM Customer_acquisition;

SELECT
  channel,
  SUM(cost) / NULLIF(SUM(conversion_rate), 0) AS cpa,
  SUM(revenue) / NULLIF(SUM(cost), 0) AS roas,
  SUM(conversion_rate) AS estimated_acquisitions
FROM customer_acquisition
GROUP BY channel
ORDER BY channel;
