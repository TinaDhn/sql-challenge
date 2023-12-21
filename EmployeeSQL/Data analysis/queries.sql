--List the employee number, last name, first name, sex, and salary of each employee.
CREATE VIEW Question_one AS
SELECT e.emp_no AS "emploee Number",
	   e.first_name, 
	   e.last_name, 
	   e.sex, 
	   s.salary
FROM employees AS e
LEFT JOIN salaries AS s
  ON e.emp_no = s.emp_no
ORDER BY e.last_name ASC

SELECT * FROM Question_one

--List the first name, last name, and hire date for the employees who were hired in 1986
CREATE VIEW Question_two AS
SELECT first_name, last_name, hire_date 
	FROM employees
	WHERE EXTRACT(YEAR FROM hire_date) = 1986;
	
SELECT * FROM Question_two

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
CREATE VIEW Question_three AS
SELECT e.emp_no AS "emploee Number",
	   e.first_name, 
	   e.last_name,
	   d.dept_no,
	   d.dept_name
FROM employees AS e
JOIN dept_emp AS de
  ON e.emp_no = de.emp_no
JOIN departments AS d
  ON de.dept_no = d.dept_no
LEFT JOIN dept_manager AS m
  ON m.dept_no = d.dept_no;
  
SELECT * FROM Question_three

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

CREATE VIEW Question_four AS
SELECT d.dept_no AS "Department number",
	   e.emp_no AS "Employee Number",
	   e.last_name AS "Last name",
	   e.first_name AS "First name", 
	   d.dept_name AS "Department name"
FROM employees AS e
JOIN dept_emp AS de
  ON e.emp_no = de.emp_no
JOIN departments AS d
  ON de.dept_no = d.dept_no;
  
SELECT * FROM Question_four

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
CREATE VIEW Question_five AS
SELECT first_name, last_name, sex 
	FROM employees
	WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%';
	
SELECT * FROM Question_five

--List each employee in the Sales department, including their employee number, last name, and first name.
CREATE VIEW Question_six AS
SELECT emp_no AS "Employee Number",
	   first_name,
	   last_name
FROM employees
WHERE emp_no IN
(
  SELECT emp_no
  FROM dept_emp 
  WHERE dept_no IN
  (
    SELECT dept_no
    FROM departments
    WHERE dept_name = 'Sales'
  )
);

SELECT * FROM Question_six

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
CREATE VIEW Question_seven AS
SELECT e.emp_no AS "Employee Number",
	   e.first_name,
	   e.last_name,
	   d.dept_name
FROM employees AS e
JOIN dept_emp AS de
  ON e.emp_no = de.emp_no
JOIN departments AS d
  ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');


SELECT * FROM Question_seven

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
CREATE VIEW Question_eight AS
SELECT last_name, COUNT(emp_no)
FROM employees
GROUP BY 1
ORDER BY 2 DESC

SELECT * FROM Question_eight
