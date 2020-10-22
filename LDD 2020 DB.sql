Create Table Customer(
    Customer_ID number(10) NOT NULL,
    Customer_Name varchar(30),
    Region_ID number(10),
    CONSTRAINT Customer_ID_PK PRIMARY KEY(Customer_ID));
    
Create Table Project(
    Project_ID NUMBER(25) NOT NULL,
    Proj_Description VARCHAR(50),
    Manager_ID NUMBER(25),
    Project_Date date,
    Est_Start_Date date,
    Est_End_Date date,
    Est_Budget NUMBER(25),
    Actual_End_Date date,
    Actual_Start_Date date,
    Actual_Total_Cost NUMBER(25),
    Customer_ID NUMBER(10),
    CONSTRAINT Project_PK primary key (Project_ID));

Create Table Bill(
    Bill_ID NUMBER(10)NOT NULL,
    Total_Hours NUMBER(10),
    Date_Of_Bill date,
    Customer_ID NUMBER(10),
    CONSTRAINT Bill_PK primary key (Bill_ID));
    
Create Table Work_log(
    Log_ID NUMBER(10)NOT NULL,
    Date_Of_Log date,
    Worked_Hours NUMBER(4),
    Employ_ID NUMBER(10),
    Bill_ID number(10),
    Assignment_ID number(10),
    CONSTRAINT Log_ID_PK PRIMARY KEY(Log_ID));

Create Table Assignment(
 Assignment_ID NUMBER(10) NOT NULL,
 Task_ID NUMBER(10),
 Employ_ID NUMBER(10),
 Project_ID NUMBER(25),
 Skill_ID NUMBER(10),
 CONSTRAINT Assignment_PK Primary Key (Assignment_ID));
    
Create Table Task(
    Task_ID NUMBER(10)NOT NULL,
    Skill_ID number(10),
    Project_ID NUMBER(25),
    Task_Desc VARCHAR(100),
    Employees_Req NUMBER(10),
    Start_Date date,
    Finish_Date date,
    CONSTRAINT Task_ID_PK PRIMARY KEY(Task_ID));

Create Table Skill(
    Skill_ID NUMBER(10) NOT NULL,
    Skill_Name varchar(50),
    Skill_Descrip VARCHAR(20),
    Pay_Rate NUMBER(10),
    CONSTRAINT Skill_ID_PK PRIMARY KEY(Skill_ID));
    
Create Table Employee(
    Employ_ID NUMBER(10) NOT NULL,
    Region_ID NUMBER(10),
    Last_Name VARCHAR2(20) NOT NULL,
    Middle_Initials VARCHAR2(2) NOT NULL,
    First_Name VARCHAR2(20) NOT NULL,
    Hire_Date date,
    CONSTRAINT Employ_ID_PK PRIMARY KEY(Employ_ID));

Create Table Employee_Skill(
    Employ_ID NUMBER(10)NOT NULL,
    Skill_ID NUMBER(10));
    
Create Table Region(
    Region_ID NUMBER(10)NOT NULL,
    Region_Name VARCHAR2(20),
    CONSTRAINT Region_ID_PK PRIMARY KEY(Region_ID));

alter table Employee
add CONSTRAINT Region_ID_FK FOREIGN KEY (Region_ID) references Region (Region_ID);

alter table Task
add CONSTRAINT Skill_ID_FK Foreign Key (Skill_ID) references Skill (Skill_ID);
alter table Task
add CONSTRAINT Project_ID_FK Foreign Key (Project_ID) references Project (Project_ID);

alter table Employee_Skill
add CONSTRAINT ESkill_ID_FK Foreign Key (Skill_ID) references Skill (Skill_ID);
alter table Employee_Skill
add CONSTRAINT SkillEmploy_ID_FK Foreign Key (Employ_ID) references Employee (Employ_ID);

alter table Assignment
add CONSTRAINT Task_ID_FK Foreign key (Task_ID) references Task (Task_ID);
alter table Assignment
add CONSTRAINT Employ_ID_FK Foreign key (Employ_ID) references Employee (Employ_ID);
alter table Assignment
add CONSTRAINT ProjAssi_ID_FK Foreign key (Project_ID) references Project (Project_ID);
alter table Assignment
add CONSTRAINT SkillAssi_ID_FK Foreign key (Skill_ID) references Skill (Skill_ID);

alter table Work_log
add CONSTRAINT Emplog_ID_FK FOREIGN KEY (Employ_ID) references Employee (Employ_ID);
alter table Work_log
add CONSTRAINT Logassign_ID_FK FOREIGN KEY (Assignment_ID) references Assignment (Assignment_ID);
alter table Work_log
add CONSTRAINT Logbill_ID_FK FOREIGN KEY (Bill_ID) references Bill (Bill_ID);

alter table Bill
add CONSTRAINT Customer_ID_FK Foreign Key (Customer_ID) references Customer (Customer_ID);

alter table Project
add CONSTRAINT Custproj_ID_FK FOREIGN KEY (Customer_ID) references Customer (Customer_ID);

alter table Customer
add CONSTRAINT Custregion_ID_FK Foreign Key (Region_ID) references Region (Region_ID);


Insert into Skill (Skill_ID, Skill_Name, Skill_Descrip, Pay_Rate) VALUES ('001', 'DataEntry1', 'EntryDataInput', 200);
Insert into Skill (Skill_ID, Skill_Name, Skill_Descrip, Pay_Rate) VALUES ('002', 'DataEntry2', 'SeniorDataInput', 300);
Insert into Skill (Skill_ID, Skill_Name, Skill_Descrip, Pay_Rate) VALUES ('003', 'SysAna1', 'EntrySysAd', 300);
Insert into Skill (Skill_ID, Skill_Name, Skill_Descrip, Pay_Rate) VALUES ('004', 'SysAna2', 'SeniorSysAd', 350);
Insert into Skill (Skill_ID, Skill_Name, Skill_Descrip, Pay_Rate) VALUES ('005', 'DBDesigner1', 'EntryDBDesign', 200);
Insert into Skill (Skill_ID, Skill_Name, Skill_Descrip, Pay_Rate) VALUES ('006', 'DBDesigner2', 'SeniorDBDesign', 250);
Insert into Skill (Skill_ID, Skill_Name, Skill_Descrip, Pay_Rate) VALUES ('007', 'OracleDev1', 'EntryOracleDev', 250);
Insert into Skill (Skill_ID, Skill_Name, Skill_Descrip, Pay_Rate) VALUES ('008', 'OracleDev2', 'SeniorOracleDev', 250);
Insert into Skill (Skill_ID, Skill_Name, Skill_Descrip, Pay_Rate) VALUES ('009', 'C++1', 'EntryCoder', 250);
Insert into Skill (Skill_ID, Skill_Name, Skill_Descrip, Pay_Rate) VALUES ('010', 'C++2', 'SeniorCoder', 270);
Insert into Skill (Skill_ID, Skill_Name, Skill_Descrip, Pay_Rate) VALUES ('011', 'ASP1', 'EntryASProgrammer', 250);
Insert into Skill (Skill_ID, Skill_Name, Skill_Descrip, Pay_Rate) VALUES ('012', 'ASP2', 'SeniorASProgrammer', 270);
Insert into Skill (Skill_ID, Skill_Name, Skill_Descrip, Pay_Rate) VALUES ('013', 'OracleDBA', 'OracleDBA', 320);
Insert into Skill (Skill_ID, Skill_Name, Skill_Descrip, Pay_Rate) VALUES ('014', 'SQLServerDBA', 'SQLServerDBA', 400);
Insert into Skill (Skill_ID, Skill_Name, Skill_Descrip, Pay_Rate) VALUES ('015', 'NetworkEng1', 'EntryNetworkEngi', 350);
Insert into Skill (Skill_ID, Skill_Name, Skill_Descrip, Pay_Rate) VALUES ('016', 'NetworkEng2', 'SeniorNetworkEngi', 400);
Insert into Skill (Skill_ID, Skill_Name, Skill_Descrip, Pay_Rate) VALUES ('017', 'WebAdmin', 'WebAdmin', 250);
Insert into Skill (Skill_ID, Skill_Name, Skill_Descrip, Pay_Rate) VALUES ('018', 'TechWriter', 'Tech.Writing', 250);
Insert into Skill (Skill_ID, Skill_Name, Skill_Descrip, Pay_Rate) VALUES ('019', 'ProjManager', 'ProjectManagement', 450);

Insert into Region (Region_ID, Region_Name) VALUES ('001', 'N');
Insert into Region (Region_ID, Region_Name) VALUES ('002', 'E');
Insert into Region (Region_ID, Region_Name) VALUES ('003', 'S');
Insert into Region (Region_ID, Region_Name) VALUES ('004', 'W');
Insert into Region (Region_ID, Region_Name) VALUES ('005', 'NE');
Insert into Region (Region_ID, Region_Name) VALUES ('006', 'NW');
Insert into Region (Region_ID, Region_Name) VALUES ('007', 'SE');
Insert into Region (Region_ID, Region_Name) VALUES ('008', 'SW');

Insert into Employee (Employ_ID, Region_ID, Last_Name, Middle_Initials, First_Name, Hire_Date) Values ('001', '001', 'Wolcott', 'K.', 'Jane', date '2015-03-05');
Insert into Employee (Employ_ID, Region_ID, Last_Name, Middle_Initials, First_Name, Hire_Date) Values ('002', '007', 'Smith', 'L.', 'James', date '2015-02-09');
Insert into Employee (Employ_ID, Region_ID, Last_Name, Middle_Initials, First_Name, Hire_Date) Values ('003', '003', 'Chris', 'I.', 'Kattan', date '2015-08-05');
Insert into Employee (Employ_ID, Region_ID, Last_Name, Middle_Initials, First_Name, Hire_Date) Values ('004', '004', 'Jose', 'H.', 'Smith', date '2015-07-04');
Insert into Employee (Employ_ID, Region_ID, Last_Name, Middle_Initials, First_Name, Hire_Date) Values ('005', '002', 'Federico', 'R.', 'Perci', date '2014-03-02');
Insert into Employee (Employ_ID, Region_ID, Last_Name, Middle_Initials, First_Name, Hire_Date) Values ('006', '002', 'Joseph', 'K.', 'Chandler', date '2014-03-07');
Insert into Employee (Employ_ID, Region_ID, Last_Name, Middle_Initials, First_Name, Hire_Date) Values ('007', '003', 'Emily', 'G.', 'Bush', date '2016-01-05');
Insert into Employee (Employ_ID, Region_ID, Last_Name, Middle_Initials, First_Name, Hire_Date) Values ('008', '004', 'Surgena', 'Y.', 'Kilby', date '2013-07-12');
Insert into Employee (Employ_ID, Region_ID, Last_Name, Middle_Initials, First_Name, Hire_Date) Values ('009', '001', 'Duerte', 'U.', 'Miriam', date '2015-12-11');
Insert into Employee (Employ_ID, Region_ID, Last_Name, Middle_Initials, First_Name, Hire_Date) Values ('010', '002', 'Paine', 'E.', 'Maximilian', date '2014-07-15');
Insert into Employee (Employ_ID, Region_ID, Last_Name, Middle_Initials, First_Name, Hire_Date) Values ('011', '008', 'Wayne', 'L.', 'Max', date '2015-07-15');
Insert into Employee (Employ_ID, Region_ID, Last_Name, Middle_Initials, First_Name, Hire_Date) Values ('012', '005', 'Stone', 'J.', 'Steven', date '2013-07-15');
Insert into Employee (Employ_ID, Region_ID, Last_Name, Middle_Initials, First_Name, Hire_Date) Values ('013', '006', 'Stone', 'F.', 'Jake', date '2014-02-25');

Insert into Customer (Customer_ID, Customer_Name, Region_ID) values ('001', 'C Rocks', '008');
Insert into Customer (Customer_ID, Customer_Name, Region_ID) values ('002', 'D Rocks', '003');
Insert into Customer (Customer_ID, Customer_Name, Region_ID) values ('003', 'E Rocks', '006');
Insert into Customer (Customer_ID, Customer_Name, Region_ID) values ('004', 'F Rocks', '007');
Insert into Customer (Customer_ID, Customer_Name, Region_ID) values ('005', 'G Rocks', '005');
Insert into Customer (Customer_ID, Customer_Name, Region_ID) values ('006', 'H Rocks', '001');
Insert into Customer (Customer_ID, Customer_Name, Region_ID) values ('007', 'I Rocks', '002');
Insert into Customer (Customer_ID, Customer_Name, Region_ID) values ('008', 'J Rocks', '004');

Insert into Project (PROJECT_ID,PROJ_DESCRIPTION,MANAGER_ID,PROJECT_DATE,EST_START_DATE, EST_END_DATE,EST_BUDGET,ACTUAL_END_DATE,ACTUAL_START_DATE,ACTUAL_TOTAL_COST,CUSTOMER_ID) 
VALUES ('0001','InitialInterview','050', date '2016-03-01',date '2016-03-03',date '2016-03-02','22000',date '2016-03-03',date '2016-03-01','15000','001');
Insert into Project (PROJECT_ID,PROJ_DESCRIPTION,MANAGER_ID,PROJECT_DATE,EST_START_DATE, EST_END_DATE,EST_BUDGET,ACTUAL_END_DATE,ACTUAL_START_DATE,ACTUAL_TOTAL_COST,CUSTOMER_ID) 
VALUES ('0002','DBDesign','050', date '2016-03-07',date '2016-03-12',date '2016-03-08','15000',date '2016-03-12',date '2016-03-8','10000','001');
Insert into Project (PROJECT_ID,PROJ_DESCRIPTION,MANAGER_ID,PROJECT_DATE,EST_START_DATE, EST_END_DATE,EST_BUDGET,ACTUAL_END_DATE,ACTUAL_START_DATE,ACTUAL_TOTAL_COST,CUSTOMER_ID) 
VALUES ('0003','SysDesign','050', date '2016-03-14',date '2016-03-22',date '2016-03-15','25000',date '2016-03-21',date '2016-03-15','22000','001');
Insert into Project (PROJECT_ID,PROJ_DESCRIPTION,MANAGER_ID,PROJECT_DATE,EST_START_DATE, EST_END_DATE,EST_BUDGET,ACTUAL_END_DATE,ACTUAL_START_DATE,ACTUAL_TOTAL_COST,CUSTOMER_ID) 
VALUES ('0004','SysCodeTest','050', date '2016-03-23',date '2016-03-26',date '2016-03-24','20000',date '2016-03-27',date '2016-03-23','20000','001');
Insert into Project (PROJECT_ID,PROJ_DESCRIPTION,MANAGER_ID,PROJECT_DATE,EST_START_DATE, EST_END_DATE,EST_BUDGET,ACTUAL_END_DATE,ACTUAL_START_DATE,ACTUAL_TOTAL_COST,CUSTOMER_ID) 
VALUES ('0005','SysDocument','050', date '2016-03-28',date '2016-04-02',date '2016-04-03','10000',date '2016-04-04',date '2016-03-29','15000','001');
Insert into Project (PROJECT_ID,PROJ_DESCRIPTION,MANAGER_ID,PROJECT_DATE,EST_START_DATE, EST_END_DATE,EST_BUDGET,ACTUAL_END_DATE,ACTUAL_START_DATE,ACTUAL_TOTAL_COST,CUSTOMER_ID) 
VALUES ('0006','FinalEval','050', date '2016-04-05',date '2016-04-10',date '2016-04-06','4000',date '2016-04-12',date '2016-04-06','40000','001');
Insert into Project (PROJECT_ID,PROJ_DESCRIPTION,MANAGER_ID,PROJECT_DATE,EST_START_DATE, EST_END_DATE,EST_BUDGET,ACTUAL_END_DATE,ACTUAL_START_DATE,ACTUAL_TOTAL_COST,CUSTOMER_ID) 
VALUES ('0007','On-SiteDatLoad','050', date '2016-04-14',date '2016-04-17',date '2016-04-19','40000',date '2016-04-17',date '2016-04-13','45000','001');
Insert into Project (PROJECT_ID,PROJ_DESCRIPTION,MANAGER_ID,PROJECT_DATE,EST_START_DATE, EST_END_DATE,EST_BUDGET,ACTUAL_END_DATE,ACTUAL_START_DATE,ACTUAL_TOTAL_COST,CUSTOMER_ID) 
VALUES ('0008','SignOff','050', date '2016-04-18',date '2016-04-19',date '2016-04-20','1000',date '2016-04-19',date '2016-04-18','1000','001');

Insert into Bill (Bill_ID, Total_Hours, Date_of_Bill, Customer_ID) values ('001', '04', date '2016-03-01', '001');
Insert into Bill (Bill_ID, Total_Hours, Date_of_Bill, Customer_ID) values ('002', '77', date '2016-03-16', '001');
Insert into Bill (Bill_ID, Total_Hours, Date_of_Bill, Customer_ID) values ('003', '72', date '2016-03-31', '001');
Insert into Bill (Bill_ID, Total_Hours, Date_of_Bill, Customer_ID) values ('004', '56', date '2016-04-15', '001');
Insert into Bill (Bill_ID, Total_Hours, Date_of_Bill, Customer_ID) values ('005', '84', date '2016-04-30', '001');

Insert into Employee_Skill (Skill_ID, Employ_ID) values ('019', '001');
Insert into Employee_Skill (Skill_ID, Employ_ID) values ('002', '003');
Insert into Employee_Skill (Skill_ID, Employ_ID) values ('004', '003');
Insert into Employee_Skill (Skill_ID, Employ_ID) values ('017', '005');
Insert into Employee_Skill (Skill_ID, Employ_ID) values ('013', '002');
Insert into Employee_Skill (Skill_ID, Employ_ID) values ('014', '004');
Insert into Employee_Skill (Skill_ID, Employ_ID) values ('018', '006');
Insert into Employee_Skill (Skill_ID, Employ_ID) values ('010', '006');
Insert into Employee_Skill (Skill_ID, Employ_ID) values ('010', '007');
Insert into Employee_Skill (Skill_ID, Employ_ID) values ('008', '007');
Insert into Employee_Skill (Skill_ID, Employ_ID) values ('012', '008');
Insert into Employee_Skill (Skill_ID, Employ_ID) values ('006', '008');

Insert into Task (Task_ID, Skill_ID, Project_ID, Task_Desc, Employees_Req, Start_Date, Finish_Date) values
('001', '019', '001', 'InitInterview', '01', date '2016-03-01', date '2016-03-03');
Insert into Task (Task_ID, Skill_ID, Project_ID, Task_Desc, Employees_Req, Start_Date, Finish_Date) values
('002', '006', '002', 'DBDesign', '02', date '2016-03-08', date '2016-03-12');
Insert into Task (Task_ID, Skill_ID, Project_ID, Task_Desc, Employees_Req, Start_Date, Finish_Date) values
('003', '019', '003', 'System Design', '01', date '2016-03-15', date '2016-03-21');
Insert into Task (Task_ID, Skill_ID, Project_ID, Task_Desc, Employees_Req, Start_Date, Finish_Date) values
('005', '019', '004', 'SysCodeTest', '01', date '2016-03-29', date '2016-04-04');
Insert into Task (Task_ID, Skill_ID, Project_ID, Task_Desc, Employees_Req, Start_Date, Finish_Date) values
('006', '019', '004', 'SysDocument', '01', date '2016-04-06', date '2016-04-12');
Insert into Task (Task_ID, Skill_ID, Project_ID, Task_Desc, Employees_Req, Start_Date, Finish_Date) values
('007', '019', '005', 'FinalEval', '01', date '2016-04-17', date '2016-04-19');
Insert into Task (Task_ID, Skill_ID, Project_ID, Task_Desc, Employees_Req, Start_Date, Finish_Date) values
('008', '019', '006', 'OnSiteLoad', '01', date '2016-04-20', date '2016-04-26');
Insert into Task (Task_ID, Skill_ID, Project_ID, Task_Desc, Employees_Req, Start_Date, Finish_Date) values
('009', '004', '007', 'OnSiteLoad', '01', date '2016-04-20', date '2016-04-26');
Insert into Task (Task_ID, Skill_ID, Project_ID, Task_Desc, Employees_Req, Start_Date, Finish_Date) values
('010', '005', '007', 'OnSiteLoad', '01', date '2016-04-20', date '2016-04-26');
Insert into Task (Task_ID, Skill_ID, Project_ID, Task_Desc, Employees_Req, Start_Date, Finish_Date) values
('011', '008', '007', 'OnSiteLoad', '01', date '2016-04-20', date '2016-04-26');
Insert into Task (Task_ID, Skill_ID, Project_ID, Task_Desc, Employees_Req, Start_Date, Finish_Date) values
('012', '019', '008', 'SignOff', '01', date '2016-04-27', date '2016-04-28');

Insert into Assignment (Assignment_ID, Employ_ID, Task_ID, Project_ID, Skill_ID) values
('001', '001', '001', '001', '019');
Insert into Assignment (Assignment_ID, Employ_ID, Task_ID, Project_ID, Skill_ID) values
('002', '008', '002', '002', '006');
Insert into Assignment (Assignment_ID, Employ_ID, Task_ID, Project_ID, Skill_ID) values
('003', '007', '005', '004', '010');
Insert into Assignment (Assignment_ID, Employ_ID, Task_ID, Project_ID, Skill_ID) values
('004', '003', '011', '007', '004');
Insert into Assignment (Assignment_ID, Employ_ID, Task_ID, Project_ID, Skill_ID) values
('005', '004', '011', '007', '014');
Insert into Assignment (Assignment_ID, Employ_ID, Task_ID, Project_ID, Skill_ID) values
('006', '005', '007', '005', '017');

Insert into Work_log (Log_ID, Date_Of_Log, Worked_Hours, Employ_ID, Bill_ID, Assignment_ID) values
('001', date '2016-03-04', '05', '001', '001', '001');
Insert into Work_log (Log_ID, Date_Of_Log, Worked_Hours, Employ_ID, Bill_ID, Assignment_ID) values
('002', date '2016-03-10', '08', '008', '002', '002');
Insert into Work_log (Log_ID, Date_Of_Log, Worked_Hours, Employ_ID, Bill_ID, Assignment_ID) values
('003', date '2016-03-15', '08', '007', '002', '003');
Insert into Work_log (Log_ID, Date_Of_Log, Worked_Hours, Employ_ID, Bill_ID, Assignment_ID) values
('004', date '2016-03-17', '06', '003', '003', '004');
Insert into Work_log (Log_ID, Date_Of_Log, Worked_Hours, Employ_ID, Bill_ID, Assignment_ID) values
('005', date '2016-03-20', '08', '004', '003', '005');
Insert into Work_log (Log_ID, Date_Of_Log, Worked_Hours, Employ_ID, Bill_ID, Assignment_ID) values
('006', date '2016-04-15', '07', '005', '004', '006');

Select * from bill;
Select * from employee;
Select * from employee_skill;
Select * from assignment;
select* from region;
select * from customer;
Select * from skill;
Select * from task;
Select * from work_log;


select concat(upper(last_name) || ', ', first_name) "Full Name", Hire_date as "Hire Date" from employee order by last_name;
select min(pay_rate) as "Minimum", max(pay_rate) as "Maximum", round(avg(pay_rate), 2) as "Average", round(stddev(pay_rate),2) as "Standard Deviation" from skill;
select e.region_id as "Region ID", d.Skill_Name as "Skill Name", round(avg(d.pay_rate), 2) as "Pay Rate" from Region e, skill d where d.skill_id = e.region_id
group by e.region_id, d.Skill_Name order by avg(pay_rate) desc;
select * from work_log where worked_hours < '08';
select * from work_log where worked_hours = '08';
Select * from employee where last_name = 'Stone';
Select last_name || ', ' || first_name as "Full Name", Hire_date as "Hire Date" from employee where Hire_Date > date '2014-01-01' order by first_name;
Select * from customer order by region_id;
Select Customer_Name as "Customer Name", customer_id as "Customer ID" from Customer where Customer_name like 'D%';
Select Project_ID as "Project ID", Proj_Description as "Proj. Description", est_budget as "Estimated Budget", Actual_total_cost as "Final Cost" from project where est_budget > actual_total_cost;
Select * from Project where est_end_date > actual_end_date order by actual_total_cost;