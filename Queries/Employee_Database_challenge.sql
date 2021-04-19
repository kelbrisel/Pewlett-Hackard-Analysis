-- DELIVERABLE 1: Number Retiring Employees

-- Retrieve the emp_no, first_name and last_name columns from the Employees table
SELECT emp_no, first_name, last_name
FROM employees

--Retrieve the title, from_date, and to_date columns from the titles
SELECT title, from_date, to_date
FROM titles

--Create a new table using the INTO clause
SELECT e.emp_no, 
	e.first_name, 
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles as t
ON t.emp_no = e.emp_no
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no;

SELECT * FROM retirement_titles
SELECT * FROM employees
SELECT * FROM titles

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles

-- Write another query to rerieve the nu ber of employees by 
-- their most recent job titles who are about to retire

SELECT COUNT(ut.title) AS "count", ut.title
INTO retiring_titles 
FROM unique_titles  AS ut
GROUP BY title
ORDER BY "count" DESC;

SELECT * FROM retiring_titles

-- END DELIVERABLE 1

-- DELIVERABLE 2: Mentorship Eligibility
SELECT DISTINCT ON (e.emp_no) e.emp_no, 
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no ASC;

DROP TABLE mentorship_eligibility
SELECT * FROM mentorship_eligibility


--END DELIVERABLE 2