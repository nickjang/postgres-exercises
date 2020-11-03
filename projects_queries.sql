-- How many people work in the Sales department?
SELECT d.dept_name as department, COUNT(*) as total_employees 
FROM department as d
JOIN employee as e ON d.id = e.department
WHERE d.dept_name = 'Sales'
GROUP BY d.dept_name;
-- List the names of all employees assigned to the 'Plan Christmas party' project.
SELECT e.emp_name as employee
FROM project as p
JOIN employee_project as ep ON p.id = ep.project_id
JOIN employee as e ON ep.emp_id = e.id
WHERE p.project_name LIKE 'Plan Christmas party';
-- List the names of employees from the Warehouse department that are assigned to the 'Watch paint dry' project.
SELECT e.emp_name as employee
FROM project as p
JOIN employee_project as ep ON p.id = ep.project_id
JOIN employee as e ON ep.emp_id = e.id
JOIN department as d ON e.department = d.id
WHERE d.dept_name LIKE 'Warehouse'
  AND p.project_name LIKE 'Watch paint dry';
-- Which projects are the Sales department employees assigned to?
SELECT e.emp_name as employee, p.project_name as project
FROM employee as e
LEFT JOIN employee_project as ep ON e.id = ep.emp_id
LEFT JOIN project as p ON ep.project_id = p.id
JOIN department as d ON e.department = d.id
WHERE d.dept_name LIKE 'Sales';
-- List only the managers that are assigned to the 'Watch paint dry' project.
SELECT DISTINCT e.id, e.emp_name as employee, e.phone, e.title, e.salary
FROM department as d
JOIN employee as e ON d.manager = e.id
JOIN employee_project as ep ON e.id = ep.emp_id
JOIN project as p ON ep.project_id = p.id
WHERE p.project_name LIKE 'Watch paint dry';