--1. List the following details of each employee:
-- employee number, last name, first name, gender, and salary.
-- from employees: employee number (emp_no), last name (last_name), first name (first_name), gender
-- from salaries: employee number (emp_no), salary
SELECT s.emp_no, e.last_name, e.first_name, e.gender, s.salary
from employees as e
inner join salaries as s
on s.emp_no = e.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986
select emp_no,first_name,last_name,hire_date
from employees
where extract(year from hire_date) = 1986

--List the manager of each department 
--along with their department number, department name, employee number, last name, and first name
select distinct on (dept_manager.dept_no) dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name,dept_manager.from_date, dept_manager.to_date
from dept_manager 
inner join departments 
on dept_manager.dept_no= departments.dept_no
inner join employees 
on dept_manager.emp_no = employees.emp_no
order by dept_manager.dept_no, dept_manager.to_date DESC;

--List the department number for each employee along with that 
--employee’s employee number, last name, first name, and department name
select distinct on (e.emp_no) e.emp_no, e.last_name, e.first_name,d.dept_name
from employees as e
left join dept_emp as de
on e.emp_no = de.emp_no
inner join departments as d
on de.dept_no = d.dept_no
order by e.emp_no, de.to_date DESC;

-- 5. List all employees whose first name is "Hercules" 
--and last names begin with "B.
select e.last_name, e.first_name
from employees as e
where (e.first_name = 'Hercules') and (lower(e.last_name) like 'b%')
order by e.last_name;






