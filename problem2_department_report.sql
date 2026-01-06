WITH dept_stats AS (
    SELECT 
        d.dept_name,
        COUNT(de.emp_no) AS emp_count,
        AVG(s.salary) AS avg_salary
    FROM departments d
    JOIN dept_emp de ON d.dept_no = de.dept_no
    JOIN salaries s ON de.emp_no = s.emp_no
    WHERE de.to_date = '9999-01-01'
      AND s.to_date = '9999-01-01'
    GROUP BY d.dept_name
)
SELECT *,
       RANK() OVER (ORDER BY avg_salary DESC) AS dept_rank
FROM dept_stats
WHERE avg_salary > (SELECT AVG(salary) FROM salaries)
ORDER BY avg_salary DESC
LIMIT 3;
