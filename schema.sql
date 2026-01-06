-- EMPLOYEES DATABASE
CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hire_date DATE
);

CREATE TABLE salaries (
    emp_no INT,
    salary INT,
    from_date DATE,
    to_date DATE,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- DEPARTMENTS
CREATE TABLE departments (
    dept_no VARCHAR(10) PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE dept_emp (
    emp_no INT,
    dept_no VARCHAR(10),
    from_date DATE,
    to_date DATE,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- E-COMMERCE
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    country VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2)
);

-- SALES
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    sale_date DATE,
    amount DECIMAL(10,2)
);

-- ERASMUS
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    home_country VARCHAR(50)
);

CREATE TABLE erasmus_programs (
    program_id INT PRIMARY KEY,
    host_country VARCHAR(50),
    university VARCHAR(100)
);

CREATE TABLE student_programs (
    student_id INT,
    program_id INT,
    start_date DATE,
    end_date DATE
);

-- BANKING
CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    transaction_date TIMESTAMP,
    amount DECIMAL(10,2),
    type VARCHAR(20)
);
