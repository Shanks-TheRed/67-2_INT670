--1.1
SELECT
	 l.city
	,COUNT(l.city) AS Total
FROM DEPARTMENTS d
INNER JOIN LOCATIONS l
	ON d.location_id = l.location_id
GROUP BY l.city
ORDER BY
	 Total DESC
	,l.city;

--1.2
SELECT
	 d.department_name
	,COUNT(d.department_name) AS Total_Emp
	,SUM(e.salary) AS Total_Sal
FROM DEPARTMENTS d
INNER JOIN EMPLOYEES e
	ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY
	 Total_Sal DESC
	,d.department_name;

-- 2.1
SELECT
	 r.region_name
	,c.country_name
	,l.state_province
	,l.city
	,d.department_name
FROM DEPARTMENTS d
INNER JOIN LOCATIONS l
	ON d.location_id = l.location_id
INNER JOIN COUNTRIES c
	on l.country_id = c.country_id
INNER JOIN REGIONS r
	on c.region_id = r.region_id
ORDER BY 
	 r.region_name
	,c.country_name
	,l.state_province
	,l.city
	,d.department_name;


--2.2
SELECT
	 j.job_title
	,gmin.grade_level AS Grade_Min
	,gmax.grade_level AS Grade_Max
FROM JOBS j
INNER JOIN JOB_GRADES gmax
	ON j.max_salary BETWEEN gmax.lowest_sal AND gmax.highest_sal
INNER JOIN JOB_GRADES gmin
	ON j.min_salary BETWEEN gmin.lowest_sal AND gmin.highest_sal
ORDER BY
	 gmax.grade_level DESC
	,gmin.grade_level DESC
	,j.job_title;