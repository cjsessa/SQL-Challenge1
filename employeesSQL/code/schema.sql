-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/XPJx5K
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

CREATE TABLE employees (
    emp_no          varchar(30)   NOT NULL,
    birth_date      date          NOT NULL,
    first_name      varchar(30)   NOT NULL,
    last_name       varchar(30)   NOT NULL,
    gender          varchar(30)   NOT NULL,
    hire_date       date   NOT NULL,
    PRIMARY KEY (emp_no)
);

CREATE TABLE departments (
    dept_no         varchar(30)   NOT NULL,
    dept_name       varchar(40)   NOT NULL,
    PRIMARY KEY (dept_no),
    UNIQUE (dept_name)
);

CREATE TABLE dept_emp (
    emp_no          varchar(30)   NOT NULL,
    dept_no         varchar(30)   NOT NULL,
    from_date       date          NOT NULL,
    to_date         date          NOT NULL,
    PRIMARY KEY (emp_no,dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

CREATE TABLE dept_manager (
    dept_no         varchar(30)   NOT NULL,
    emp_no          varchar(30)   NOT NULL,
    from_date       date          NOT NULL,
    to_date         date          NOT NULL,
    PRIMARY KEY (dept_no,emp_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

CREATE TABLE salaries (
    emp_no          varchar(30)   NOT NULL,
    salary          int   NOT NULL,
    from_date       date   NOT NULL,
    to_date         date   NOT NULL,
    PRIMARY KEY (emp_no,from_date),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE titles (
    emp_no           varchar(30)   NOT NULL,
    title            varchar(30)   NOT NULL,
    from_date        date          NOT NULL,
    to_date          date,
    PRIMARY KEY (emp_no,title,from_date),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

