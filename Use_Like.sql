
📊 TEST DATA (Use for All Questions)

Employee Table

Employee(
  emp_id INT,
  emp_name VARCHAR(50),
  email VARCHAR(100),
  phone VARCHAR(15),
  department VARCHAR(30),
  city VARCHAR(30),
  salary INT,
  joining_date DATE
)

Sample Data

INSERT INTO Employee VALUES
(101, 'Amit Sharma', 'amit.sharma@tcs.com', '9876543210', 'IT', 'Delhi', 75000, '2021-03-15'),
(102, 'Anita Verma', 'anita_v@infosys.com', '9876501234', 'HR', 'Pune', 52000, '2020-07-10'),
(103, 'Rahul Singh', 'rahul.singh@wipro.com', '9123456789', 'Finance', 'Mumbai', 68000, '2019-11-25'),
(104, 'Rohit Meena', 'rohit.meena@tcs.com', '9812345678', 'IT', 'Jaipur', 82000, '2022-01-12'),
(105, 'Neha Gupta', 'neha.gupta@gmail.com', '9998887776', 'Marketing', 'Delhi', 60000, '2021-06-01'),
(106, 'Arjun Patel', 'arjun_p@accenture.com', '9001234567', 'IT', 'Ahmedabad', 91000, '2018-09-19'),
(107, 'Sneha Roy', 'sneha.roy@deloitte.com', '9123987654', 'Audit', 'Kolkata', 73000, '2017-12-05'),
(108, 'Sanjay Kumar', 'sanjay.kumar@yahoo.com', '8887776665', 'HR', 'Delhi', 48000, '2023-04-20'),
(109, 'Ankit Jain', 'ankit.jain@tcs.com', '7776665554', 'Finance', 'Indore', 67000, '2020-02-14'),
(110, 'Pooja Malhotra', 'pooja.m@infosys.com', '9991112223', 'IT', 'Chandigarh', 85000, '2019-08-08');

1️⃣ LIKE (% and _)

1. Find employees whose name starts with ‘A’ and ends with ‘a’.

2. Find employees whose email domain is exactly @tcs.com.

3. Find employees whose second letter of name is ‘n’.

4. Find employees whose name contains exactly 5 characters.

5. Find employees whose email contains exactly one underscore (_).

6. Find employees whose phone number starts with 9 and ends with 0.

7. Find employees whose name has ‘ee’ consecutively anywhere.

8. Find employees whose email does NOT start with their first name.

9. Find employees whose city name has exactly 6 characters.

10. Find employees whose email username (before @) ends with a digit.

11. Find employees whose name starts with a consonant and ends with ‘r’.
    
12. Find employees whose email contains ‘.’ before @ symbol.

13. Find employees whose third character of department is ‘T’.

14. Find employees whose email has more than 15 characters before @.

15. Find employees whose name contains space as the 5th character.

16. Find employees whose email does not contain underscore.

17. Find employees whose city starts with ‘D’ and has exactly 5 letters.

18. Find employees whose name has exactly two words.

19. Find employees whose email ends with .com but not @gmail.com.

20. Find employees whose name has at least 3 vowels.

use question;

SELECT * FROM Employee WHERE emp_name LIKE 'A%a';

SELECT * FROM Employee WHERE email LIKE '%@tcs.com';

SELECT * FROM Employee WHERE emp_name LIKE '_n%';

SELECT * FROM Employee WHERE emp_name LIKE '_____';

SELECT * FROM Employee WHERE email LIKE '%\_%' AND email NOT LIKE '%\_%\_%';

SELECT * FROM Employee WHERE phone LIKE '9%0';

SELECT * FROM Employee WHERE emp_name LIKE '%ee%';
select * from employee where emp_name like concat(emp_name,"%");
SELECT * FROM Employee WHERE city LIKE '______';

SELECT * FROM Employee
WHERE email LIKE '%0@%' 
   OR email LIKE '%1@%' 
   OR email LIKE '%2@%' 
   OR email LIKE '%3@%' 
   OR email LIKE '%4@%' 
   OR email LIKE '%5@%' 
   OR email LIKE '%6@%' 
   OR email LIKE '%7@%' 
   OR email LIKE '%8@%' 
   OR email LIKE '%9@%';

SELECT * FROM Employee
WHERE emp_name LIKE '_%r'
AND emp_name NOT LIKE 'A%r'
AND emp_name NOT LIKE 'E%r'
AND emp_name NOT LIKE 'I%r'
AND emp_name NOT LIKE 'O%r'
AND emp_name NOT LIKE 'U%r';

SELECT * FROM Employee
WHERE email LIKE '%.%@%';

