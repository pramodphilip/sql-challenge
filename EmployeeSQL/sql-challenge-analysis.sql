--1. List the following details of each employee: 
--employee number, last name, first name, sex, and salary.
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees e, salaries s
where e.emp_no = s.emp_no

--2. List first name, last name, and hire date for employees 
--who were hired in 1986.
select first_name, last_name, hire_date
from employees
where EXTRACT(YEAR FROM hire_date) = 1986

--3. List the manager of each department with the following 
--information: department number, department name, the 
--manager's employee number, last name, first name.
select dm.dept_no, d.dept_name, dm.emp_no, emp.last_name, emp.first_name
from dept_manager dm, departments d, employees emp
where dm.dept_no = d.dept_no and dm.emp_no = emp.emp_no

--4. List the department of each employee with the following 
--information: employee number, last name, first name, and department name.
select demp.emp_no, emp.last_name, emp.first_name, d.dept_name
from dept_emp demp, employees emp, departments d
where demp.dept_no = d.dept_no and demp.emp_no = emp.emp_no

--5. List first name, last name, and sex for employees whose 
--first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex 
from employees
where first_name = 'Hercules' and last_name like 'B%'; 

--6. List all employees in the Sales department, including 
--their employee number, last name, first name, and department 
--name.
--information: employee number, last name, first name, and department name.
select demp.emp_no, emp.last_name, emp.first_name, d.dept_name
from dept_emp demp, employees emp, departments d
where demp.emp_no = emp.emp_no and d.dept_no = 
(select demp.dept_no where d.dept_name = 'Sales')

--7. List all employees in the Sales and Development departments,
--including their employee number, last name, first name, and 
--department name.
select demp.emp_no, emp.last_name, emp.first_name, d.dept_name
from dept_emp demp, employees emp, departments d
where demp.emp_no = emp.emp_no and d.dept_no = 
(select demp.dept_no where d.dept_name = 'Sales' or d.dept_name = 'Development')

--8. In descending order, list the frequency count of employee 
--last names, i.e., how many employees share each last name.
select last_name, count(last_name)
from employees
Group by last_name
order by count(last_name) desc
