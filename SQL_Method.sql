Find the total salary paid in the company.
  
Find the average salary of all employees.
 Display the highest salary in each department.
Find the lowest salary in each department.
  Count how many employees are working in each department.
  Find the total salary paid in each department.
Find departments where total salary > 500000.
Find departments where average salary > 60000.
Show departments having more than 10 employees.
Find the difference between MAX and MIN salary in each department.
Find the average salary for each job role.
Display job roles where average salary > 70000.
Find the count of employees hired in each year.
Find the total salary paid in each year of joining.
Find departments where minimum salary > 40000.
Find job roles where maximum salary < 100000.
Display departments where AVG salary < 50000 AND total salary > 200000.
Find the total bonus paid per department.
Find departments where the salary range (MAX – MIN) > 30000.
Count employees in each department whose salary is NOT NULL.
Find job roles where at least 5 employees exist.
Find departments where total salary BETWEEN 200000 AND 800000.
Find years where more than 20 employees were hired.
Find departments where: AVG salary > 60000, MIN salary > 35000, COUNT > 5 (using HAVING only).
Find job roles where: MAX salary > 90000, AVG salary > 65000, Total employees > 3.



CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept VARCHAR(30),
    job_role VARCHAR(30),
    salary INT,
    bonus INT,
    hire_year INT
);

INSERT INTO Employees VALUES
(31,'Amit','IT','Developer',70000,5000,2021),
(32,'Rahul','IT','Developer',65000,4000,2022),
(33,'Neha','IT','Tester',50000,3000,2023),
(34,'Priya','HR','HR',45000,2000,2022),
(35,'Rohan','HR','HR',48000,2500,2021),
(36,'Vikas','Finance','Accountant',55000,3500,2020),
(37,'Ankit','Finance','Accountant',52000,3000,2021),
(38,'Pooja','Finance','Manager',90000,7000,2019),
(1,'Amit','IT','Developer',70000,5000,2021),
(2,'Rahul','IT','Developer',65000,4000,2022),
(3,'Neha','IT','Tester',50000,3000,2023),
(4,'Priya','HR','HR',45000,2000,2022),
(5,'Rohan','HR','HR',48000,2500,2021),
(6,'Vikas','Finance','Accountant',55000,3500,2020),
(7,'Ankit','Finance','Accountant',52000,3000,2021),
(8,'Pooja','Finance','Manager',90000,7000,2019),
(9,'Suresh','IT','Manager',95000,8000,2020),
(10,'Karan','IT','Developer',72000,4500,2023),
(11,'Mohit','Sales','Salesman',40000,2000,2022),
(12,'Sonia','Sales','Salesman',42000,2200,2021),
(13,'Ajay','Sales','Manager',85000,6000,2020),
(14,'Deepak','IT','Tester',48000,3000,2023),
(15,'Nisha','HR','Manager',80000,6000,2019),
(16,'Ravi','Finance','Accountant',51000,3200,2022),
(17,'Komal','IT','Developer',68000,4200,2021),
(18,'Tarun','Sales','Salesman',39000,1800,2023),
(19,'Isha','Finance','Manager',88000,6500,2021),
(20,'Manoj','HR','HR',46000,2300,2020),
(21,'Simran','IT','Tester',51000,3100,2022),
(22,'Varun','IT','Developer',73000,4700,2020),
(23,'Gaurav','Sales','Salesman',41000,2100,2021),
(24,'Kavita','Finance','Accountant',53000,3300,2023),
(25,'Anu','HR','HR',47000,2400,2023),
(26,'Lokesh','IT','Developer',71000,4600,2022),
(27,'Pankaj','Finance','Accountant',56000,3600,2020),
(28,'Meena','Sales','Manager',87000,6200,2019),
(29,'Arun','IT','Tester',49500,3050,2021),
(30,'Shweta','HR','Manager',82000,6100,2022);


select * from employees;

select sum(salary) as total_salary from Employees;

select avg(salary) as average_salary from employees;

select dept, max(salary) as high_salary from employees group by dept; 

select dept , min(salary) as lower_salary from employees group by dept;

select dept, count(emp_id) as total_employees from employees group by dept;

select dept, sum(salary) as total_salary_paid from employees group by dept;

select dept , sum(salary) as total_salary_500000 from employees group by dept having sum(salary)>500000;

select dept , sum(salary) as total_salary_600000 from employees group by dept having sum(salary)> 600000;

select dept, count(emp_id) total_employees from employees group by dept having count(emp_id)>10; 

select dept, max(salary) as max_salary , min(salary) as min_salary from employees group by dept ;


