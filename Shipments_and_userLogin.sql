

1. Identify shipments delivered after the expected date.


2. Find shipments that are not delivered but payment is completed.


3. Display shipments where payment is not done.





1. Fetch users whose login attempts are greater than 3 and account is locked.

2. Display users who are not active.

3. Find users whose login attempts are less than or equal to 2.



CREATE TABLE shipments (
    shipment_id INT,
    expected_date DATE,
    delivery_date DATE,
    payment_status VARCHAR(20)
);


INSERT INTO shipments VALUES
(301, '2024-01-10', '2024-01-12', 'PAID'),
(302, '2024-01-15', '2024-01-14', 'PAID'),
(303, '2024-01-20', NULL, 'PAID'),
(304, '2024-01-18', NULL, 'PENDING');

select * from shipments;
select * from shipments where expected_date = delivery_date;
##select *from shipments where  delivery_date!= 0 and payment_status='paid';
select *from shipments where not payment_status='paid';

CREATE TABLE user_logins (
    user_id INT,
    login_attempts INT,
    account_status VARCHAR(20)
);

#📌 Test Data
INSERT INTO user_logins VALUES
(401, 5, 'LOCKED'),
(402, 1, 'ACTIVE'),
(403, 4, 'LOCKED'),
(404, 2, 'ACTIVE');

select * from user_logins ;
select * from user_logins where login_attempts > 3 and not account_status ='active';
select * from user_logins where account_status!='active';
select * from user_logins where login_attempts <=2;
