--1.
SELECT emp_no, first_name, last_name
FROM employees

--2.
SELECT title, from_date, to_date
FROM titles

--3.
SELECT employees.emp_no, first_name, last_name, birth_date, from_date, to_date, title 
INTO retirement_titles
FROM employees
INNER JOIN titles ON employees.emp_no=titles.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY employees.emp_no;

--4
SELECT retirement_titles.emp_no, 
	retirement_titles.first_name, 
	retirement_titles.last_name, 
	retirement_titles.birth_date,
	titles.title, 
	titles.from_date,
	titles.to_date
FROM retirement_titles
LEFT JOIN titles
ON retirement_titles.emp_no = titles.emp_no;

--5
SELECT retirement_titles.emp_no, 
	retirement_titles.first_name, 
	retirement_titles.last_name, 
	retirement_titles.birth_date,
	titles.title, 
	titles.from_date,
	titles.to_date
FROM retirement_titles
LEFT JOIN titles
ON retirement_titles.emp_no = titles.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31');


SELECT retirement_titles.emp_no, 
	retirement_titles.first_name, 
	retirement_titles.last_name, 
	retirement_titles.birth_date,
	titles.title, 
	titles.from_date,
	titles.to_date
FROM retirement_titles
LEFT JOIN titles
ON retirement_titles.emp_no = titles.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY titles.emp_no;

SELECT emp_no, first_name, last_name, title, birth_date, to_date, from_date
from retirement_titles
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY retirement_titles.emp_no;

SELECT emp_no, first_name, last_name
FROM retirement_titles;

SELECT DISTINCT ON (emp_no) emp_no,
first_name, 
last_name,
title
--INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC , to_date DESC;

SELECT COUNT (DISTINCT title) 
FROM unique_titles;


SELECT emp_no, first_name, last_name, title
FROM unique_titles;

SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT DESC;



SELECT DISTINCT ON (emp_no) employees.emp_no, first_name, last_name, birth_date,
dept_emp.from_date, dept_emp.to_date,
title
INTO mentorship
FROM employees 
INNER JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
INNER JOIN titles ON employees.emp_no=titles.emp_no
WHERE employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY employees.emp_no; 