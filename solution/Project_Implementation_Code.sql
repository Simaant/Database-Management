/* The following the code for the implementation of a healthcare database management system*/

--Creation of all the required tables

--Patient Table
Create table Patient
(
Patient_ID numeric primary key,
PFName varchar(20) not null,
PLName varchar(20) not null,
PGender varchar(10) not null,
PDoB varchar(10) not null,
PWeight decimal(6,2) not null, 
PHeight decimal(6,2) not null,
PNext_Of_Kin varchar(20) not null,
PHome_Phone varchar(20) not null,
PHouseNo varchar(20) not null,
PStreetName varchar(20) not null,
PCity varchar(10) not null,
PState varchar(20) not null,
POther_Details varchar(50) null,
PDoctor_ID numeric not null foreign key references Doctor(Doctor_ID)
);

select * from Patient;
drop table Patient;


--Staff Table
create table Staff
(
Staff_ID numeric primary key,
SFName varchar(20) not null,
SLName varchar(20) not null,
SGender varchar(10) not null,
SJob_Title varchar(20) not null,
SQualifications varchar(30) not null,
SOther_Details varchar(50) null
);

select * from Staff;
drop table Staff;


--Doctor Table
create table Doctor
(
Doctor_ID numeric primary key,
DFName varchar(20) not null,
DLName varchar(20) not null,
DPost varchar(20) not null,
DRoom_No varchar(10) not null
);

select * from Doctor;
drop table Doctor;


--Patient Record Table
create table Patient_Record
(
PatientRecord_ID int identity(2001,1) primary key,
Patient_Record_Component_Details varchar(50) not null,
Admission_Datetime varchar(20) not null,
RPatient_ID numeric not null foreign key references Patient(Patient_ID),
RStaff_ID numeric not null foreign key references Staff(Staff_Id),
RComponent_Code numeric not null foreign key references Record_Components(Component_Code),
RDoctor_ID numeric not null foreign key references Doctor(Doctor_ID)
);

select * from Patient_Record;
drop table Patient_Record;


--Record Components Table
create table Record_Components
(
Component_Code numeric primary key,
Component_Description varchar(60) not null
);

select * from Record_Components;
drop table Record_Components;


--Patient Room Table
create table Patient_Room
(
Room_ID numeric primary key,
Room integer not null,
Duration integer null,
Date_From_To varchar(20) null,
Room_Patient_ID numeric not null foreign key references Patient(Patient_ID)
);

select * from Patient_Room;
drop table Patient_Room;


--patient payment Methods Table
create table Patient_Payment_Methods
(
Payment_ID numeric primary key,
Method_Details varchar(50) not null,
Payment_Patient_ID numeric not null foreign key references Patient(Patient_ID)
);

select * from Patient_Payment_Methods;
drop table Patient_Payment_Methods;


--Bills Table
create table Bills
(
Bill_ID numeric primary key,
Total_Amount_Due decimal(6,2) not null,
Date_Of_Payment	varchar(20) not null,
Other_Details varchar(50) null,
Bill_Patient_ID numeric not null foreign key references Patient(Patient_ID) 
);

select * from Bills;
drop table Bills;

--Bill Items table
create table Bill_Items
(
Item_No numeric primary key,
Name varchar(20) not null,
Quantity integer not null,
Total_Cost decimal(6,2) not null,
Final_Bill_ID numeric not null foreign key references Bills(Bill_ID)
);

select * from Bill_Items;
drop table Bill_Items;

----------------Populating the tables-----------------------------

/*************Patient Details************************/

insert into
Patient values(1, 'Nathan', 'Kerr', 'M', '02/22/1980', 149.91, 180.34, 'Martha', '315-395-9581', '321', 'Avondale Pl', 'Syracuse', 'New York', 
NULL, 2);

insert into
Patient values(2, 'John', 'Smith', 'M', '04/24/1985', 159.91, 160.34, 'Pam', '315-395-9682', '114', 'Lafayette Rd', 'Syracuse', 'New York', 
NULL, 2);

insert into
Patient values(3, 'Diane', 'Nelsen', 'F', '05/22/1975', 151.91, 180.34, 'Robert', '315-395-9031', '678', 'Victoria Pl', 'Syracuse', 'New York', 
'Cough and Cold', 3);

insert into
Patient values(4, 'Christy', 'Jones', 'F', '08/18/1990', 165.91, 156.34, 'Michael', '315-395-8097', '104', 'Columbus Av', 'Syracuse', 'New York', 
'Dizziness, feverish & cold', 1);

insert into
Patient values(5, 'Simaant', 'Patil', 'M', '02/22/1996', 151.00, 160.34, 'Jayant', '315-395-9550', '559', 'Lancaster Av', 'Syracuse', 'New York', 
'Cough', 3);

insert into
Patient values(6, 'Megan', 'Schultz', 'F', '12/20/1990', 151.91, 150.34, 'John', '315-395-9901', '708', 'Concord Pl', 'Syracuse', 'New York', 
'Bike accident, extreme pain in the right leg', 4);

select * from Patient;

/**********Details of Staff***************************/

insert into 
Staff values(1, 'Megan', 'Fox', 'F', 'Receptionist', 'Qualified Professional', null);

insert into 
Staff values(2, 'Amy', 'Schrute', 'F', 'Nurse', 'Qualified Nurse', null);

insert into 
Staff values(3, 'Stanley', 'Davis', 'M', 'Nurse', 'Qualified Nurse', null);

insert into 
Staff values(4, 'Carol', 'Danvers', 'F', 'Nurse', 'Qualified Nurse', null);

select * from Staff;
************Details of Doctors***********************

insert into
Doctor values(1, 'Gregory', 'House', 'Physician', '103');

insert into
Doctor values(2, 'Meredith', 'Grey', 'Physician', '003');

insert into
Doctor values(3, 'Steve', 'Rogers', 'Physician', '105');

insert into
Doctor values(4, 'Steven', 'Strange', 'Surgeon', '106');

select * from Doctor;


/***********Patient Record******************/
insert into Patient_Record values('General Checkup', '03/09/19 - 13:30', 1, 2, 301, 2);
insert into Patient_Record values('Follow-up', '03/13/19 - 10:30', 2, 2, 302,2);
insert into Patient_Record values('First time visit', '04/06/19 - 14:00', 3, 3, 303, 3);
insert into Patient_Record values('Need to admit', '04/08/19 - 12:00', 4, 4, 304, 1);
insert into Patient_Record values('General checkup', '04/09/19 - 10:00', 5, 2, 305, 3);
insert into Patient_Record values('Need for surgery', '04/10/19 - 12:00', 6, 4, 306, 4);

select * from Patient_Record;
/****************Record Components*************************/
insert into Record_Components values(301, 'Health checkup');
insert into Record_Components values(302, 'Follow-up on fever');
insert into Record_Components values(303, 'New patient with cough and cold');
insert into Record_Components values(304, 'Body ache, high fever and dizziness');
insert into Record_Components values(305, 'Check up on cough')
insert into Record_Components values(306, 'Bike accident, possile fracture in right leg')

select * from Record_Components;
/****************Patient Room*******************************/
insert into Patient_Room values(1, 102, null, null, 1);
insert into Patient_Room values(2, 102, null, null, 2);
insert into Patient_Room values(3, 103, null, null, 3);
insert into Patient_Room values(4, 202, 5, '04/08/19-04/12/19', 4);
insert into Patient_Room values(5, 103, null, null, 5);
insert into Patient_Room values(6, 204, 10, 04/10/19-04/20/19, 6);

select * from Patient_Room;
/****************Patient Payment Methods**************************/
insert into Patient_Payment_Methods values(1, 'Credit Card', 1);
insert into Patient_Payment_Methods values(2, 'Cash', 2);
insert into Patient_Payment_Methods values(3, 'Debit Card', 3);
insert into Patient_Payment_Methods values(4, 'Credit Card', 4);
insert into Patient_Payment_Methods values(5, 'Cash', 5);
insert into Patient_Payment_Methods values(6, 'Credit card and Insurance', 6);

/*******************Bills*****************************************/
insert into Bills values(100, 30.00, '03/09/19', null, 1);
insert into Bills values(200, 15.00, '03/13/19', null, 2);
insert into Bills values(300, 50.00, '04/06/19', null, 3);
insert into Bills values(400, 630.00, '04/12/19', 'Bill contains admission expenses as well', 4);
insert into Bills values(500, 30.00, '04/09/19', null, 5);
insert into Bills values(600, 1260.00, '04/20/19','Bill contains cost of surgery', 6);

select * from Bills;
/*******************Bill Items************************************/
insert into Bill_Items values (1001,'Cough Syrup', 1, 15, 100);
insert into Bill_Items values (3001,'Cough Syrup', 1, 15, 300);
insert into Bill_Items values (3002,'Cold Tablets', 2,20, 300);
insert into Bill_Items values (4001,'Glucose', 4, 100, 400);
insert into Bill_Items values (4002,'Cough Syrup', 2, 30, 400);
insert into Bill_Items values (4003,'Pain Killers', 2, 60, 400);
insert into Bill_Items values (5001,'Cough Syrup', 1, 15, 500);
insert into Bill_Items values (6001,'Pain Killers', 2, 60, 600);
insert into Bill_Items values (6002,'Glucose', 10, 200, 600 );

select * from Bill_Items;


/********************Major Data Questions********************/

/*Select patients first name and last name treated by meredith grey*/
select PFName, PLName 
from Patient as p inner join Doctor as d
on d.Doctor_ID=p.PDoctor_ID
where DLName='House';


/*Select female patients with their first name and last name and their date of admission/visit and time to the hospital*/
select PFName, PLName, PGender, Admission_Datetime
from Patient as p inner join Patient_Record as pr
on pr.RPatient_ID=p.Patient_ID
where PGender='F';


/*show bills of patients greater than 100$. display first name and last name*/
select PFName, PLName, Total_Amount_Due
from Patient as p inner join Bills as b
on b.Bill_Patient_ID=p.Patient_ID
where Total_Amount_Due > 100;


/*Select the names of physicians from the list of doctors and the corresponding patient names that they treat*/
select DFName, DLName, DPost, PFName, PLName
from Patient as p inner join Doctor as d
on d.Doctor_ID=p.PDoctor_ID
where DPost='Physician';


/*Select the names of patients paying via cards*/
select PFname, PLName, Method_Details
from Patient as p inner join Patient_Payment_Methods as pm
on pm.Payment_Patient_ID=p.Patient_ID
where Method_Details in ('Credit Card', 'Debit Card');








