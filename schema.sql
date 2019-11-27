create table departments
(
	dept_no varchar primary key not null,
	dept_name varchar not null
);

create table dept_emp
(
	emp_no int not null,
	dept_no varchar not null,
	from_date date not null,
	to_date date not null
	
);

create table dept_manager
(
	dept_no varchar not null,
	emp_no int primary key not null,
	from_date date not null,
	to_date date not null
); 

create table employees
(
	emp_no int primary key not null,
	birth_date date not null,
	first_name varchar not null,
	last_name varchar not null,
	gender varchar(5) not null,
	hire_date date not null
);

create table salaries
(
	emp_no int primary key not null, 
	salary int not null,
	from_date date not null,
	to_date date not null
);

create table titles
(
	emp_no int not null,
	title varchar not null,
	from_date date not null,
	to_date date not null
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

