# BankingDatabase

### Introduction
Bright Horizon Corporation, a community bank, approached us to transition from a file-based approach to a database approach. We took on multiple roles in this project, starting as Information Architects to gather client requirements and design a conceptual model. As Database Designers, we created a comprehensive database. Finally, as Data Analysts, we derived insights and visualizations from the data.

### Problem Statement
The financial services industry has witnessed significant growth, leading to an exponential increase in data. The project's aim is to build a system that securely and efficiently manages financial information.

### Database Design
The database primarily focuses on information related to the bank's branches and its clients. Here's an overview of the database structure:
- Branches are identified by name, address, and a unique branch code. Each branch is associated with multiple customers.
- Banks have employees, each with a unique ID, name, address, phone number(s), date of birth, age, and gender. Branches have multiple employees.
- Customers are uniquely identified by a customer ID, and they have names, addresses, date of birth, age, and phone numbers. Customers open accounts with balances and account numbers.
- Accounts can be categorized as Savings and Checkings accounts. Savings accounts have interest rates, while Checkings accounts have overdraft amounts.
- Banks offer loans, and each customer can borrow one loan at a time, identified by amount, type, and Loan ID. Loans are approved based on the customer's credit history.
- The repayment of loans can be done through various methods. Customers can contact Customer Care for assistance.

### Conceptual Data Modeling
We created conceptual models using both EER (Enhanced Entity-Relationship) and UML (Unified Modeling Language).

### Mapping Conceptual Model to Relational Model
We mapped the conceptual model to the relational model. Some key tables include:
- Branch
- Employee
- Employee-Phone
- Account
- Checkings
- Savings
- Customer
- Customer-Phone
- Loan
- Debt
- Credit History
- Customer Care Agent
- Contact
- Payment

### Implementation of Relational Model
We implemented the relational model using SQL queries. Some example SQL queries include:
- Displaying branches providing interest rates higher than the average.
- Identifying customers eligible for a credit card based on credit scores.
- Counting the number of customers with different types of loans.
- Displaying customer debts and their respective interest rates.
- Showing the allocation of employees to customers.
- Displaying important details about a specific account.
- Finding the customer with the highest loan.
- Displaying the hierarchy of a particular employee.

### Implementation of NoSQL Model
We also created a NoSQL model for efficient data retrieval.

### Data Visualizations using Python
Data from the MySQL Workbench was connected using mysqlconnector and visualized with Python. Some visualizations include:
- The types of loans most applied for.
- Age groups and their corresponding loan amounts.
- Branches and their offered interest rates.

### Summary and Future Scope
As the financial services industry continues to grow, the demand for effective data management is increasing. Our project successfully transitions from a file-based approach to a database approach, reducing data redundancy, avoiding data inconsistencies, and preventing data losses. This solution, though implemented on a smaller scale, can easily be applied to manage much larger volumes of data.
