
-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
select a.emp_no, a.first_name, a.last_name, a.gender, b.salary
from 
	employees as a
left join
	salaries as b
on
	a.emp_no = b.emp_no;

-- 2. List employees who were hired in 1986.
select first_name, last_name, hire_date
from employees
where extract(year from hire_date) = 1986;

-- 3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select a.dept_no,a.dept_name,b.emp_no,b.dept_no,c.first_name,c.last_name,c.hire_date
from 
	departments as a
inner join
	dept_manager as b
on
	a.dept_no = b.dept_no
inner join
	employees as c
on
	b.emp_no = c.emp_no;
-- 4. List the department of each employee with the following information:
--employee number, last name, first name, and department name.
select a. dept_no, a.dept_name, b.emp_no, c.last_name, c.first_name
from
	departments as a
inner join
	dept_emp as b
on
	a.dept_no = b.dept_no
inner join
	employees as c
on
	b.emp_no = c.emp_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name from employees
where 
	first_name = 'Hercules'
and
	last_name like 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select a.*, b.emp_no, c.first_name,c.last_name
from
	departments as a
inner join 
	dept_emp as b
on
	a.dept_no = b.dept_no

inner join
	employees as c
on
	b.emp_no = c.emp_no
where 
	dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
select a.*, b.emp_no, c.first_name,c.last_name
from
	departments as a
inner join 
	dept_emp as b
on
	a.dept_no = b.dept_no
inner join
	employees as c
on
	b.emp_no = c.emp_no
where 
	dept_name = 'Sales'
or
	dept_name = 'Development';
	
-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name) as count from employees
group by last_name
order by count desc
;