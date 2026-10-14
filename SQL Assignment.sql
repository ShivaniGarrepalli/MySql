-- BANKING SCENARIO
USE sql_assignment;
-- Customers
create table Customer(c_id int primary key auto_increment,c_name varchar(40),city varchar(40));

-- Accounts
create table accounts(account_id int primary key auto_increment,c_id int,account_type varchar(40),balance decimal(10,2),foreign key (c_id) REFERENCES  Customer(c_id));

-- Sample Data
insert into Customer (c_name,city) values ('GNR','Warangal'),('Madhavi','khammam'),('Bhavani','Chennai'),('Shivani','Hyderabad');
select * from Customer;

insert into accounts (c_id, account_type, balance) values(1,'Savings',50000),(1,'Current',20000),(2,'Savings',30000),(3,'Savings',15000),(4,'Current',40000);
select * from accounts;

-- RAILWAY RESERVATION SCENARIO

-- Trains
create table Train(train_id int primary key auto_increment,train_name varchar(50),source varchar(40),destination varchar(50));

-- Bookings
create table bookings(booking_id int primary key auto_increment,train_id int,passenger_name varchar(50),fare decimal(10,2),status varchar(50), foreign key (train_id) references Train(train_id));

-- Sample Data
insert into Train (train_name,source,destination) values ('Express1','Chennai','Madurai'),('Express2','Coimbatore','Salem'),('Express3','Madurai','Chennai');

-- Bookings
insert into bookings (train_id, passenger_name, fare, status) values (1, 'gnr', 500, 'confirmed'), (1, 'madhavi', 500, 'waiting'), (2, 'bhavani', 300, 'confirmed'), (3, 'shivani', 450, 'cancelled'), (2, 'meena', 300, 'confirmed');

-- BANKING SCENARIO – QUESTIONS
-- 1.	Retrieve all accounts with balance greater than 20,000.
select * from accounts where balance>20000;

-- 2.	Find customers who live in Chennai.
select * from Customer where city='chennai';

-- 3.	Display accounts with balance between 20,000 and 50,000.
select * from accounts where balance between 20000 and 50000;

-- 4.	Find customers whose names start with 'S'.
select * from Customer where c_name like 'S%';

-- 5.	Retrieve accounts of type 'Savings' or 'Current'.
select * from accounts where account_type='Savings' or account_type='Current';

-- 6.	Display accounts that are not 'Savings'.
select * from accounts where account_type not in ('Savings');

--  7.	Find customers whose names contain the letter 'a'.
select * from Customer where c_name like '%a%'or c_name like 'a%'or c_name like'%a';

-- 8.	Retrieve accounts with balance less than or equal to 30,000.
select * from accounts where balance<=30000;

-- 9.	Find customers who are not from Hyderabad.
select * from Customer where city not in ('Hyderabad');

-- 10.	Display accounts where balance is not between 10,000 and 40,000.
select * from accounts where balance not between 10000 and 40000;

-- 11.	Retrieve customers whose names end with 'i'.
select * from Customer where c_name like '%i';

-- 12.	Find accounts with balance equal to 50,000.
select * from accounts where balance = 50000;

-- 13.	Display customers whose city is either Chennai or Hyderabad.
select * from Customer where city in('chennai','hyderabad');

-- 14.	Find accounts with balance greater than 10,000 and less than 40,000.
select * from accounts where balance>10000 and balance<40000;

-- 15.	Retrieve accounts where account type is not in ('Current').
select * from accounts where account_type not in ('current');

-- ORDER BY

-- 16.	Display all accounts sorted by balance in descending order.
select * from accounts order by balance desc;

-- 17.	List customers sorted alphabetically by name.
select * from Customer order by c_name asc;

-- 18.	Display accounts sorted by account type and then by balance (descending).
select * from accounts order by account_type and balance desc;

-- Aggregate Functions
-- 19.	Find the total balance of all accounts.
select  sum(balance) from accounts;

-- 20.	Calculate the average balance of accounts.
select avg(balance) from accounts;

-- 21.	Find the maximum account balance.
select max(balance) from accounts;

-- 22.	Find the minimum account balance.
select min(balance) from accounts;

-- 23.	Count the total number of customers.
select count(*) from Customer;

-- GROUP BY + HAVING

-- 24.	Find total balance grouped by account type.
select account_type, SUM(balance) as total_balance from accounts group by account_type;

-- 25.	Find average balance for each account type.
select account_type,avg(balance) as average_balance from accounts group by account_type;

-- 26.	Display account types having average balance greater than 30,000.
select account_type,avg(balance) as average_balance from accounts group by account_type having avg(balance)>30000;

-- 27.	Count number of accounts for each customer.
select c_id,count(*) from accounts group by c_id;

-- 28.	Display customers having more than one account.
select c_id,count(*) from accounts group by c_id having count(*)>1;

--  JOINS
-- 29.	Retrieve customer names along with their account balances.
select c.c_name,a.balance from Customer c join accounts a on c.c_id = a.c_id;

-- 30.	Display all customers and their accounts (including customers without accounts).
select c.c_name, a.account_id, a.account_type, a.balance from customer c  join accounts a on c.c_id = a.c_id;

-- 31.	Display all accounts and corresponding customer details.
select a.account_id, a.account_type, a.balance, c.c_name, c.city from accounts a  join customer c on a.c_id = c.c_id;

-- 32.	Retrieve customer names and account types where balance is greater than 20,000.
select c.c_name, a.account_type from customer c  join accounts a on c.c_id = a.c_id where a.balance > 20000;

-- 33.	List customers with their total balance using JOIN.
select c.c_name, sum(a.balance) as total_balance from customer c join accounts a on c.c_id = a.c_id group by c.c_id, c.c_name;

-- 34.	Display customer names and balances sorted by balance.
select c.c_name, a.balance from customer c join accounts a on c.c_id = a.c_id order by a.balance;

-- 35.	Count number of accounts for each city using JOIN.
select c.city, count(a.account_id) as account_count from customer c join accounts a on c.c_id = a.c_id group by c.city;

--  SUBQUERIES
-- 36.	Find accounts with balance greater than average balance.
select * from accounts where balance > (select avg(balance) from accounts);

-- 37.	Retrieve customers who have accounts.
select * from customer where c_id in (select c_id from accounts);

-- 38.	Find customers who do not have any accounts.
select * from customer where c_id not in (select c_id from accounts);

-- 39.	Display account(s) with the maximum balance.
select * from accounts where balance = (select max(balance) from accounts);

-- 40.	Find customers whose total balance is greater than 40,000.
select c_id, sum(balance) as total_balance from accounts group by c_id having sum(balance) > 40000;

--  RAILWAY RESERVATION – QUESTIONS
-- 41.	Retrieve all bookings with fare greater than 400.
select * from bookings where fare>400;

-- 42.	Find bookings where status is not 'Confirmed'.
select * from bookings where status not in  ('confirmed');

-- 43.	Display trains starting from Chennai.
select * from Train where source='chennai';

-- 44.	Retrieve bookings with fare between 300 and 500.
select * from bookings where fare between 300 and 500;

-- 45.	Find passengers whose names start with 'S'.
select * from bookings where passenger_name like 's%';

-- JOINS + GROUP BY + ORDER BY

-- 46.	Retrieve train names along with passenger names.
select  t.train_name ,b.passenger_name from Train t join bookings b on t.train_id = b.train_id;

-- 47.	Count number of bookings for each train.
select t.train_name,count(booking_id) from Train t join bookings b on t.train_id =b.train_id group by  t.train_id, t.train_name;

-- 48.	Display train names and total fare collected for each train.
select t.train_name,sum(fare) from train t join bookings b on t.train_id=b.train_id group by t.train_id,t.train_name;

-- SUBQUERIES

-- 49.	Find bookings with fare equal to the highest fare.
select * from bookings where fare in (select max(fare) from bookings);

-- 50.	Retrieve trains that have more than one booking.
select * from Train where train_id IN (select train_id from bookings group by train_id having COUNT(*) > 1);

-- EMPLOYEE MANAGEMENT

create table Employee (emp_id INT PRIMARY KEY,emp_name VARCHAR(50),department VARCHAR(30),salary DECIMAL(10,2),city VARCHAR(30),joining_date DATE);

insert into employee values (101,'john','it',60000,'chennai','2022-01-15'), (102,'david','hr',45000,'bangalore','2021-03-10'), (103,'smith','it',70000,'chennai','2020-07-12'), (104,'mary','finance',55000,'mumbai','2023-01-20'), (105,'james','hr',48000,'delhi','2022-05-05'), (106,'linda','finance',65000,'mumbai','2021-08-18');

-- Customers Table
create table customers (customer_id int primary key, customer_name varchar(50), city varchar(30));
insert into customers (customer_id, customer_name, city) values (1, 'gnr', 'warangal'), (2, 'madhavi', 'khammam'), (3, 'bhavani', 'chennai'), (4, 'shivani', 'hyderabad'), (5, 'meena', 'vijayawada');

-- Orders Table
create table orders (order_id int primary key, customer_id int, amount decimal(10,2), order_date date, foreign key(customer_id) references customers(customer_id));
insert into orders (order_id, customer_id, amount, order_date) values (101, 1, 3000, '2026-01-10'), (102, 1, 4500, '2026-01-15'), (103, 1, 2500, '2026-02-01'), (104, 1, 2000, '2026-02-10'), (105, 2, 1500, '2026-01-12'), (106, 2, 2500, '2026-01-20'), (107, 3, 5000, '2026-02-05'), (108, 3, 6000, '2026-02-15'), (109, 4, 3000, '2026-02-20'), (110, 4, 4000, '2026-03-01');

-- Students Table
create table students (student_id int primary key, student_name varchar(50), department varchar(30), marks int);
insert into students (student_id, student_name, department, marks) values (1, 'gnr', 'computer science', 85), (2, 'madhavi', 'electronics', 78), (3, 'bhavani', 'computer science', 92), (4, 'shivani', 'mechanical', 67), (5, 'sai teja', 'electronics', 88), (6, 'sai pavan', 'computer science', 73), (7, 'swathi', 'mechanical', 95), (8, 'dheeraj', 'electronics', 81);

-- Employee Table
-- 1.	Find the total number of employees in each department.
select count(emp_id) Total_No_Employees from employee group by department;

-- 2.	Find the average salary of employees in each department.
select avg(salary)  Avg_sal from employee group by department;

-- 3.	Display departments having more than one employee.
select department from employee group by department having count(emp_id)>1;

-- 4.	Find the highest salary in each department.
select max(salary) from employee group by department;

-- 5.Find the lowest salary in each department.
select department, min(salary) as lowest_salary from employee group by department;

-- 6.	Find departments whose average salary is greater than 50,000.
select department,avg(salary) from employee group by department having avg(salary)>50000;

-- 7.	Calculate the total salary expenditure for each department.
select department, sum(salary) as total_salary_expenditure from employee group by department;

-- 8.	Display all employees sorted by salary in descending order.
select * from employee order by salary desc;

-- 9.	Display employees sorted first by department and then by salary in descending order.
select * from employee order by department,salary desc;

-- 10.	Find cities that have more than one employee.
select city from employee group by city having count(emp_id) > 1;

-- 11. Find the total salary paid in each city
select city, sum(salary) as total_salary from employee group by city;

-- 12. Display departments ordered by total salary expenditure from highest to lowest
select department, sum(salary) as total_salary from employee group by department order by total_salary desc;

-- 13. Find the number of employees in each department whose salary is greater than 50000
select department, count(*) as total_employees from employee where salary > 50000 group by department;

-- 14. Find the difference between the highest and lowest salary in each department
select department, max(salary) - min(salary) as salary_difference from employee group by department;

-- 15. Display the top 3 highest-paid employees
select * from employee order by salary desc limit 3;

-- Customers & Orders Tables

-- 16. Find the total order amount for each customer
select c.customer_name, sum(o.amount) as total_order_amount from customers c join orders o on c.customer_id = o.customer_id group by c.customer_id;

-- 17. Find customers who have placed more than 3 orders
select c.customer_name, count(o.order_id) as total_orders from customers c join orders o on c.customer_id = o.customer_id group by c.customer_id having count(o.order_id) > 3;

-- 18. Find the average order amount for each customer.
select c.customer_name, avg(o.amount) as average_order_amount from customers c join orders o on c.customer_id = o.customer_id group by c.customer_id;

-- 19. Find the highest order amount placed by each customer.
select c.customer_name, max(o.amount) as highest_order_amount from customers c join orders o on c.customer_id = o.customer_id group by c.customer_id;

-- 20. Display customers sorted by their total purchase amount.
select c.customer_name, sum(o.amount) as total_purchase from customers c join orders o on c.customer_id = o.customer_id group by c.customer_id order by total_purchase desc;

-- 21. Find customers whose total purchase amount exceeds 10,000.
select c.customer_name, sum(o.amount) as total_purchase from customers c join orders o on c.customer_id = o.customer_id group by c.customer_id having sum(o.amount) > 10000;

-- 22. Display customer names along with the total number of orders placed.
select c.customer_name, count(o.order_id) as total_orders from customers c left join orders o on c.customer_id = o.customer_id group by c.customer_id;

-- 23. Find the customer who spent the highest amount.
select c.customer_name, sum(o.amount) as total_purchase from customers c join orders o on c.customer_id = o.customer_id group by c.customer_id order by total_purchase desc limit 1;

-- 24. Find the customer who placed the maximum number of orders.
select c.customer_name, count(o.order_id) as total_orders from customers c join orders o on c.customer_id = o.customer_id group by c.customer_id order by total_orders desc limit 1;

-- 25. Find customers whose average order amount is greater than 2,000.
select c.customer_name, avg(o.amount) as average_order_amount from customers c join orders o on c.customer_id = o.customer_id group by c.customer_id having avg(o.amount) > 2000;

-- 26. Display the top 5 customers based on total purchase amount.
select c.customer_name, sum(o.amount) as total_purchase from customers c join orders o on c.customer_id = o.customer_id group by c.customer_id order by total_purchase desc limit 5;

-- 27. Find the minimum order amount for each customer.
select c.customer_name, min(o.amount) as minimum_order_amount from customers c join orders o on c.customer_id = o.customer_id group by c.customer_id;

-- 28. Find customers who have placed orders worth more than 5,000 in total.
select c.customer_name, sum(o.amount) as total_purchase from customers c join orders o on c.customer_id = o.customer_id group by c.customer_id having sum(o.amount) > 5000;

-- 29. Display customer-wise total orders and total purchase amount.
select c.customer_name, count(o.order_id) as total_orders, sum(o.amount) as total_purchase from customers c join orders o on c.customer_id = o.customer_id group by c.customer_id;

-- 30. Find customers who placed more than 2 orders and spent more than 8,000.
select c.customer_name, count(o.order_id) as total_orders, sum(o.amount) as total_purchase from customers c join orders o on c.customer_id = o.customer_id group by c.customer_id having count(o.order_id) > 2 and sum(o.amount) > 8000;

-- Students 
-- 31.	Find the average marks scored by students in each department. 
select department, avg(marks) as average_marks from students group by department;

-- 32.	Find departments whose average marks are above 75. 
select department, avg(marks) as average_marks from students group by department having avg(marks) > 75;

-- 33.	Find the highest mark scored in each department. 
select department, max(marks) as highest_marks from students group by department;

-- 34.	Find the total number of students in each department. 
select department, count(*) as total_students from students group by department;

-- 35.	Find departments having more than 5 students. 
select department, count(*) as total_students from students group by department having count(*) > 5;

-- 36.	Display departments sorted by average marks in descending order. 
select department, avg(marks) as average_marks from students group by department order by average_marks desc;

-- 37.	Find the top 3 departments based on average marks. 
select department, avg(marks) as average_marks from students group by department order by average_marks desc limit 3;

-- 38.	Find departments whose average marks are between 70 and 90. 
select department, avg(marks) as average_marks from students group by department having avg(marks) between 70 and 90;

-- 39.	Find the total marks scored by students in each department. 
select department, sum(marks) as total_marks from students group by department;

-- 40.	Display departments sorted by the total number of students. 
select department, count(*) as total_students from students group by department order by total_students;

-- 41.	Find the lowest mark scored in each department. 
select department, min(marks) as lowest_marks from students group by department;

-- 42.	Find departments where the highest mark is greater than 90. 
select department, max(marks) as highest_marks from students group by department having max(marks) > 90;

-- 43.	Find the number of students scoring above 80 in each department. 
select department, count(*) as total_students from students where marks > 80 group by department;

-- 44.	Find departments where more than 3 students scored above 75. 
select department, count(*) as total_students from students where marks > 75 group by department having count(*) > 3;

-- 45.	Display departments ordered by highest mark in descending order. 
select department, max(marks) as highest_marks from students group by department order by highest_marks desc;
