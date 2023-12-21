-- Create new titles table
CREATE TABLE titles (
  title_id VARCHAR(5),
  title VARCHAR(25),
  PRIMARY KEY (title_id)
);

-- Create new employees table
CREATE TABLE employees (
  emp_no INT,
  emp_title_id VARCHAR(5) NOT NULL,
  FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
  birth_date DATE NOT NULL,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  sex VARCHAR(5) NOT NULL,
  hire_date DATE NOT NULL,
  PRIMARY KEY (emp_no)
);

-- Create new salaries table
CREATE TABLE salaries (
  emp_no INT,
  salary INT,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  PRIMARY KEY (emp_no)
);

-- Create new departments table
CREATE TABLE departments (
  dept_no VARCHAR(4),
  dept_name VARCHAR(255) NOT NULL,
  PRIMARY KEY (dept_no)
);

-- Create new dept_emp table
CREATE TABLE dept_emp (
  emp_no INT NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  dept_no VARCHAR(4) NOT NULL,
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  PRIMARY KEY (emp_no, dept_no)
);


-- Create new dept_manager table
CREATE TABLE dept_manager (
  dept_no VARCHAR(4),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  emp_no INT,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  PRIMARY KEY (emp_no, dept_no)
);


SELECT * FROM titles
SELECT * FROM employees
SELECT * FROM salaries
SELECT * FROM departments
SELECT * FROM dept_emp
SELECT * FROM dept_manager


