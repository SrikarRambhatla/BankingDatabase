create database bank;
use bank;
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS Branch;
CREATE TABLE Branch (
Branch_code int NOT NULL PRIMARY KEY,
Branch_Name varchar(30) NOT NULL,
Branch_Address varchar(30) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee(
Emp_ID int NOT NULL PRIMARY KEY,
Emp_Last_Name varchar(30) NOT NULL,
Emp_Gender varchar(1) NOT NULL,
CONSTRAINT cc1 CHECK(Emp_Gender IN('M', 'F')),
Emp_DOB Date NOT NULL,
Emp_Age int NOT NULL,
Supervisor int NOT NULL,
#fk so doubt
Branch_code int NOT NULL,
FOREIGN KEY(Branch_code) references Branch(Branch_code)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS Emp_Phone;
CREATE TABLE Emp_Phone(
Emp_Phone_Number int NOT NULL,
Emp_ID int NOT NULL,
PRIMARY KEY(Emp_Phone_Number, Emp_ID),
FOREIGN KEY(Emp_ID) references Employee(Emp_ID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS Debt;
CREATE TABLE Debt(
Debt_Amount int NOT NULL,
Customer_ID int NOT NULL PRIMARY KEY,
Loan_ID int NOT NULL PRIMARY KEY,
SSN int NOT NULL,
FOREIGN KEY(Loan_ID) references Loan(Loan_ID),
FOREIGN KEY(Customer_ID) references Customer(Customer_ID),
FOREIGN KEY(SSN) references Credit_History(SSN)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS Payment;
CREATE TABLE Payment(
Payment_Type varchar(10) PRIMARY KEY NOT NULL,
Payment_Account int NOT NULL,
Loan_ID int NOT NULL,
FOREIGN KEY(Loan_ID) references Loan(Loan_ID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS Loan;
CREATE TABLE Loan(
Loan_ID int NOT NULL PRIMARY KEY,
Loan_Amount int NOT NULL,
Loan_Type varchar(10) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS History;
CREATE TABLE Credit_History(
SSN int NOT NULL PRIMARY KEY,
Number_of_Accounts int(3) NOT NULL,
Credit_Score int(3) NOT NULL,
CONSTRAINT cc3 CHECK(Credit_Score BETWEEN 300 AND 850),
Credit_Usage varchar(10) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS Customer;
CREATE TABLE Customer(
Customer_ID int NOT NULL PRIMARY KEY,
Customer_Last_Name varchar(30) NOT NULL,
Customer_Gender varchar(1),
CONSTRAINT cc4 CHECK(Customer_Gender IN('M', 'F')),
Customer_DOB Date NOT NULL,
Customer_Age int NOT NULL,
Loan_Id int NOT NULL,
Branch_code int NOT NULL,
FOREIGN KEY(Loan_ID) references Loan(Loan_ID),
FOREIGN KEY(Branch_code) references Branch(Branch_code)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS Account;
CREATE TABLE Account(
Account_Number int NOT NULL PRIMARY KEY,
Balance int NOT NULL,
CONSTRAINT cc2 CHECK(Balance>0),
Customer_ID int NOT NULL,
FOREIGN KEY(Customer_ID) references Customer(Customer_ID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS Checkings;
CREATE TABLE Checkings(
Account_Number int NOT NULL PRIMARY KEY,
Overdraft_Amount int NOT NULL,
FOREIGN KEY(Account_Number) references Account(Account_Number)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS Savings;
CREATE TABLE Savings(
Account_Number int NOT NULL PRIMARY KEY,
Interest_Rate float(2,2) NOT NULL,
FOREIGN KEY(Account_Number) references Account(Account_Number)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS Customer_Phone;
CREATE TABLE Customer_Phone(
Customer_Phone_Number int NOT NULL,
Customer_ID int NOT NULL,
PRIMARY KEY(Customer_Phone_Number, Customer_ID),
FOREIGN KEY(Customer_ID) references Customer(Customer_ID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS Customer_Care_Agent;
CREATE TABLE Customer_Care_Agent(
CCA_Name varchar(10) NOT NULL,
CCA_ID int(5) NOT NULL PRIMARY KEY
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS Contact;
CREATE TABLE Contact(
Customer_ID int NOT NULL PRIMARY KEY,
CCA_ID int(5) NOT NULL PRIMARY KEY,
FOREIGN KEY(Customer_ID) references Customer(Customer_ID),
FOREIGN KEY(CCA_ID) references Customer(CCA_ID)

)ENGINE=InnoDB DEFAULT CHARSET=utf8;
