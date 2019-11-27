select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from salaries;
select * from titles;

--List the following details of each employee: employee number, last name, first name, gender, and salary.
select e.emp_no, e.last_name, e.first_name, e.gender, s.salary
from employees e
left join salaries s
on e.emp_no = s.emp_no;

--List employees who were hired in 1986
select emp_no, first_name, last_name
from employees
where extract(YEAR FROM hire_date)=1986;

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
from departments d
join dept_manager dm
on dm.dept_no = d.dept_no
join employees e
on e.emp_no = dm.emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
join dept_emp de
on e.emp_no = de.emp_no
join departments d
on de.dept_no = d.dept_no;

--List all employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name 
from employees
where first_name = 'Hercules' and last_name like 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
join dept_emp de
on e.emp_no = de.emp_no
join departments d
on de.dept_no = d.dept_no
where d.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
join dept_emp de
on e.emp_no = de.emp_no
join departments d
on de.dept_no = d.dept_no
where d.dept_name IN ('Sales','Development');

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name,count(last_name) as "Frequency count of employee last names"
from employees
group by last_name 
order by "Frequency count of employee last names" desc;

