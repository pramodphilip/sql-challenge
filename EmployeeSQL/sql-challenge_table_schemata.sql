--SQL Challenge Table Schemata

--Create departments table
CREATE TABLE departments (
	dept_no VARCHAR(255) NOT NULL PRIMARY KEY,
	dept_name VARCHAR(255) NOT NULL
);


--Create titles table
CREATE TABLE titles (
	title_id VARCHAR(255) NOT NULL PRIMARY KEY,
	title VARCHAR(255) NOT NULL
);

--Create employees table 
CREATE TABLE employees (
	emp_no INT NOT NULL PRIMARY KEY,
	emp_title_id VARCHAR(255) NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
	birth_date DATE,
	first_name VARCHAR(255),
	last_name VARCHAR(255),
	sex VARCHAR(255),
	hire_date DATE
);

--Create dept_emp table
CREATE TABLE dept_emp (
	dept_no VARCHAR(255) NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (dept_no,emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--Create dept_manager table
CREATE TABLE dept_manager (
	dept_no VARCHAR(255) NOT NULL,
	emp_no int NOT NULL,
	PRIMARY KEY (dept_no,emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--Create salaries table
CREATE TABLE salaries (
	emp_no INT NOT NULL PRIMARY KEY,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INT
);
