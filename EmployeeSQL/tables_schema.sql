-- Create tables and load data tables.
DROP TABLE titles;
CREATE TABLE titles (
    title_id VARCHAR(10) PRIMARY KEY,
    title VARCHAR NOT NULL
);
SELECT *
FROM titles;

DROP TABLE employees;
CREATE TABLE employees (
  emp_no INT PRIMARY KEY,
  emp_title VARCHAR NOT NULL,
  birth_date VARCHAR(10) NOT NULL,
  first_name VARCHAR NOT NULL,
  last_name VARCHAR NOT NULL,
  sex VARCHAR(1),
  hire_date VARCHAR(10) NOT NULL,
  FOREIGN KEY (emp_title) REFERENCES titles(title_id)
);
SELECT *
FROM employees;

DROP TABLE salaries;
CREATE TABLE salaries (
    emp_no INT PRIMARY KEY,
    salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
SELECT *
FROM salaries;

DROP TABLE departments;
CREATE TABLE departments (
    dept_no VARCHAR(10) PRIMARY KEY,
    dept_name VARCHAR(30) NOT NULL
);
SELECT *
FROM departments;

DROP TABLE dept_manager;
CREATE TABLE dept_manager (
    dept_no VARCHAR(10) NOT NULL,
    emp_no INT NOT NULL,
	CONSTRAINT PK_employee PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
SELECT *
FROM dept_manager;


DROP TABLE dept_emp;
CREATE TABLE dept_emp (
    emp_no INT,
    dept_no VARCHAR,
	CONSTRAINT PK_employee_all PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
SELECT *
FROM dept_emp;