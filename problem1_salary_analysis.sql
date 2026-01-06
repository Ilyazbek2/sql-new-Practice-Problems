SELECT 
    e.emp_no,
    e.first_name,
    s.salary,
    CASE 
        WHEN s.salary > 60000 THEN 'High'
        WHEN s.salary < 40000 THEN 'Low'
    END AS salary_category
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01'
  AND (s.salary > 60000 OR s.salary < 40000)
ORDER BY s.salary DESC;
