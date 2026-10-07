CREATE DATABASE BankingManagementSystem;

USE BankingManagementSystem;

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE,
    email VARCHAR(100) UNIQUE,
    city VARCHAR(50) DEFAULT 'Chandigarh'
);

CREATE TABLE Account (
    account_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    account_type VARCHAR(20) NOT NULL DEFAULT 'Savings',
    balance DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    CHECK (balance >= 0),
    CHECK (account_type IN ('Savings', 'Current')),
    FOREIGN KEY (customer_id)
        REFERENCES Customer(customer_id)
);

INSERT INTO Customer
(customer_id, customer_name, phone, email, city)
VALUES
(101, 'Rahul Sharma', '9876543210', 'rahul@gmail.com', 'Chandigarh'),
(102, 'Priya Singh', '9876543211', 'priya@gmail.com', 'Mohali'),
(103, 'Aman Verma', '9876543212', 'aman@gmail.com', 'Ludhiana'),
(104, 'Neha Kapoor', '9876543213', 'neha@gmail.com', 'Delhi'),
(105, 'Arjun Mehta', '9876543214', 'arjun@gmail.com', 'Panchkula');

INSERT INTO Account
(account_id, customer_id, account_type, balance)
VALUES
(1001, 101, 'Savings', 25000.00),
(1002, 102, 'Current', 50000.00),
(1003, 103, 'Savings', 15000.00),
(1004, 104, 'Savings', 75000.00),
(1005, 105, 'Current', 30000.00);

SELECT *
FROM Account
WHERE balance > 25000;

SELECT *
FROM Account
ORDER BY balance DESC;

SELECT SUM(balance) AS total_balance
FROM Account;

SELECT
    MAX(balance) AS maximum_balance,
    MIN(balance) AS minimum_balance
FROM Account;

UPDATE Account
SET balance = balance + 10000
WHERE account_id = 1003;

DELETE FROM Account
WHERE balance < 20000;

SELECT *
FROM Account;

SELECT
    A.account_id,
    C.customer_name,
    A.account_type,
    A.balance
FROM Account A
JOIN Customer C
ON A.customer_id = C.customer_id;