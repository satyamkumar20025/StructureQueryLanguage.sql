

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

  #first method
select  emp_name, dept_name
 from Employee e 
 inner join Department  d on e.dept_id=d.dept_id;

  #Secod method
select  emp_name, dept_name 
from Employee e 
left join Department  d 
on e.dept_id=d.dept_id;

#2. Show employees who do not belong to any department.
  
  #first method
select emp_name
 from Employee e 
 left join Department d on e.dept_id = d.dept_id 
 where d.dept_id is null;

 #Secod method
select emp_name 
from Employee
 where dept_id is null;

#3. Fetch departments having no employees.

  
select dept_name 
from Department d 
left join Employee e 
on d.dept_id= e.dept_id 
where e.emp_id is null ;

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
from Employee e 
inner join Department d 
on e.dept_id = d.dept_id 
where dept_name in ("IT"); 



#12. Display total order amount per customer.
  
select cust_name ,sum(amount)as total_amount 
from Customer c left join Orders o
on c.cust_id=o.cust_id 
group by cust_name;

#13. Find customers who placed more than one order.
SELECT cust_name 
FROM Customer c
JOIN Orders o
ON c.cust_id = o.cust_id
GROUP BY c.cust_name
HAVING COUNT(o.order_id) > 1;

#14. Display product name and total quantity sold.
  
select prod_name,sum(quantity) 
as total_sold from Product p 
join Order_Items i on p.prod_id=i.prod_id 
group by p.prod_name;

#15. Show orders placed in February 2024 with customer names.
  
select cust_name 
from Customer c
left join Orders o
on c.cust_id=o.cust_id 
where   order_date 
between "20240201" 
and  "20240229";

#16. Find employees reporting to manager Amit.
  
SELECT emp_name
FROM Employee e
JOIN Employee m
ON e.manager_id = m.emp_id
WHERE m.emp_name = 'Amit';

#17. Show highest paid employee in each department.
  
SELECT dept_name, emp_name, salary
FROM Employee e
JOIN Department d ON e.dept_id = d.dept_id
WHERE (e.dept_id, e.salary) IN (
  SELECT dept_id, MAX(salary)
  FROM Employee
  GROUP BY dept_id
);

#18. Display employees whose department is Finance or HR.

SELECT emp_name
FROM Employee e
JOIN Department d
ON e.dept_id = d.dept_id
WHERE d.dept_name IN ('Finance','HR');

#19. Find customers whose total order value is above 25,000.
 
 SELECT cust_name
FROM Customer c
JOIN Orders o
ON c.cust_id = o.cust_id
GROUP BY c.cust_name
HAVING SUM(o.amount) > 25000;

#20. Show departments where average salary > 60,000.

SELECT dept_name
FROM Department d
JOIN Employee e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name
HAVING AVG(e.salary) > 60000;


#🔹 ADVANCED JOIN SCENARIOS (21–30)

#21. Find second highest salary employee in each department.

SELECT emp_name, dept_id, e.salary
FROM Employee e
WHERE e.salary = (
    SELECT MAX(salary)
    FROM Employee
    WHERE dept_id = e.dept_id
    AND salary < (
        SELECT MAX(salary)
        FROM Employee
        WHERE dept_id = e.dept_id
    )
);


#22. Show employees who have the same salary.
  
select emp_name,salary 
from Employee 
where salary in(
select salary 
from employee 
group by salary
having count(*)>1
); 

#23. Display latest order placed by each customer.
  
select cust_name, max(order_date) as letest_date
from Customer c
left join Orders o
on c.cust_id= o.cust_id
group by cust_name;

#24. Find products that were never ordered.

select prod_name 
from Product p 
left join order_Items o
on p.prod_id=o.prod_id
where o.prod_id is null;

#25. Display employees who are not managers.

select emp_name 
from Employee 
where emp_id not in(
select distinct manager_id
from Employee
where manager_id is not null);



