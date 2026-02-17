

create database joindb;
use joindb;



CREATE TABLE Department (
  dept_id INT PRIMARY KEY,
  dept_name VARCHAR(50)
);

INSERT INTO Department VALUES
(1,'IT'),
(2,'HR'),
(3,'Finance'),
(4,'Admin'),
(5,'Sales');




 #2️⃣ Employee Table

CREATE TABLE Employee (
  emp_id INT PRIMARY KEY,
  emp_name VARCHAR(50),
  dept_id INT,
  manager_id INT,
  salary INT,
  joining_date DATE
);

INSERT INTO Employee VALUES
(101,'Amit',1,NULL,90000,'2018-01-10'),
(102,'Ravi',1,101,60000,'2019-03-15'),
(103,'Neha',2,105,50000,'2020-06-20'),
(104,'Pooja',3,101,70000,'2017-09-25'),
(105,'Karan',2,NULL,80000,'2016-12-01'),
(106,'Sonal',NULL,101,45000,'2021-07-10'),
(107,'Rahul',5,101,30000,'2022-04-05'),
(108,'Ankit',1,101,60000,'2021-01-18'),
(109,'Meena',3,104,75000,'2019-11-11'),
(110,'Vikas',4,NULL,40000,'2020-02-02');




---

#3️⃣ Customer Table
CREATE TABLE Customer (
  cust_id INT PRIMARY KEY,
  cust_name VARCHAR(50)
);

INSERT INTO Customer VALUES
(1,'Raj'),
(2,'Simran'),
(3,'Aakash'),
(4,'Nisha'),
(5,'Kunal');



---

#4️⃣ Orders Table

CREATE TABLE Orders (
  order_id INT PRIMARY KEY,
  cust_id INT,
  order_date DATE,
  amount INT
);

INSERT INTO Orders VALUES
(1001,1,'2024-01-10',15000),
(1002,2,'2024-01-15',22000),
(1003,1,'2024-02-01',12000),
(1004,3,'2024-02-10',5000),
(1005,2,'2024-02-15',30000),
(1006,4,'2024-02-20',8000);





#5️⃣ Product Table

CREATE TABLE Product (
  prod_id INT PRIMARY KEY,
  prod_name VARCHAR(50),
  price INT
);

INSERT INTO Product VALUES
(1,'Laptop',60000),
(2,'Mouse',500),
(3,'Keyboard',1500),
(4,'Monitor',12000),
(5,'Printer',9000);




#6️⃣ Order_Items Table

CREATE TABLE Order_Items (
  order_id INT,
  prod_id INT,
  quantity INT
);

INSERT INTO Order_Items VALUES
(1001,1,1),
(1001,2,2),
(1002,3,1),
(1003,2,1),
(1003,4,1),
(1004,2,1),
(1005,1,2),
(1005,5,1);




#📝 PRACTICAL JOIN QUESTIONS (Use Above Data)

#🔹 BASIC → INTERMEDIATE (1–10)

#1. Display employee name with their department name.

select  emp_name, dept_name
 from Employee e 
 inner join Department  d on e.dept_id=d.dept_id;
 
select  emp_name, dept_name 
from Employee e left join Department  d on e.dept_id=d.dept_id;

#2. Show employees who do not belong to any department.
select emp_name
 from Employee e 
 left join Department d on e.dept_id = d.dept_id 
 where d.dept_id is null;
 
select emp_name 
from Employee
 where dept_id is null;

#3. Fetch departments having no employees.
select dept_name from Department d left join Employee e on d.dept_id= e.dept_id where e.emp_id is null ;

#4. Display employee and their manager name.
SELECT e.emp_name AS Employee, m.emp_name AS Manager
FROM Employee e
LEFT JOIN Employee m
ON e.manager_id = m.emp_id;

#5. Show customers along with their orders (include customers without orders).
SELECT c.cust_name, o.order_id
FROM Customer c
LEFT JOIN Orders o
ON c.cust_id = o.cust_id;

#6. Find customers who never placed an order.
SELECT c.cust_name
FROM Customer c
LEFT JOIN Orders o
ON c.cust_id = o.cust_id
WHERE o.order_id IS NULL;

#7. Display order id, customer name, and order amount.
select o.order_id, c.cust_name,o.amount
 from Orders o
 join Customer c
 on o.cust_id=c.cust_id;

#8. Show employees earning more than their manager.
SELECT e.emp_name
FROM Employee e
JOIN Employee m
ON e.manager_id = m.emp_id
WHERE e.salary > m.salary;

#9. Display department-wise employee count.
select dept_name ,
count(emp_id)as total_Employees 
from Department d 
left  join Employee e
 on d.dept_id= e.dept_id 
 group by d.dept_name; 

#10. Show departments having more than 2 employees.

select dept_name,
count(emp_id) as total_employee 
from Department d
 left join Employee e 
 on d.dept_id = e.dept_id
 group by dept_name
 having count(emp_id) >2;


#🔹 INTERVIEW-LEVEL (11–20)

#11. Fetch employees working in IT department.

select emp_name 
from Employee e inner join Department d  on e.dept_id = d.dept_id where dept_name in ("IT"); 
