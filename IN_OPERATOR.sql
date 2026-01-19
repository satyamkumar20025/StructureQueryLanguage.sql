
 2️⃣ IN OPERATOR 

1. Find employees working in IT, HR, or Finance.

2. Find employees located in Delhi, Pune, or Mumbai.

3. Find employees whose salary is one of: 60000, 75000, 85000.

4. Find employees whose department is in a list of audit-related departments.

5. Find employees whose email domain is in a given list of companies.

6. Find employees whose joining year is in (2019, 2020, 2021).

7. Find employees whose emp_id is in a sublist of senior employees.

8. Find employees whose city belongs to Tier-1 cities list.

9. Find employees whose phone number prefix is in given telecom series.

10. Find employees whose salary matches any manager-approved slab.

11. Find employees whose department is assigned to Project A or B.

12. Find employees whose email provider is in public email services.

13. Find employees whose name appears in a given HR shortlist.

14. Find employees whose city is part of North India locations.

15. Find employees whose salary matches any bonus-eligible salary.

16. Find employees whose joining month is in first quarter months.

17. Find employees whose department is approved for WFH.

18. Find employees whose email domain is in MNC domains list.

19. Find employees whose emp_id appears in promotion list.

20. Find employees whose city is included in new office expansion list.

### in;


select * from employee where department in("it","hr"," finance");

select * from employee where city in("delhi","pune","mumbai");

select * from employee where salary in("60000","750000","850000");

select * from employee where department in("audit");

select * from employee where email in("gmail.com","yahoo.com","campany.com");

select * from employee where year(joining_date) in(2019,2020,2021);

select * from employee where year(joining_date)in(2019);--  and salary in(salary>60000); 

select * from employee where city in("delhi","mumbbai","pune");

select * from employee WHERE LEFT (PHONE,3) IN ('777','91','987');


