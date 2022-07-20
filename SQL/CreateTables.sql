CREATE TABLE  Health_Clinic
(Clinic_ID NUMBER(5) NOT NULL,
Name VARCHAR2(255) NOT NULL,
PRIMARY KEY (Clinic_ID))
tablespace project;

CREATE TABLE Branch
(Branch_ID NUMBER(5) NOT NULL,
Address VARCHAR2(255) NOT NULL,
Phone VARCHAR2(15) NOT NULL,
Clinic_ID NUMBER(5),
PRIMARY KEY (Branch_ID),
FOREIGN KEY (Clinic_ID) REFERENCES Health_Clinic (Clinic_ID))
tablespace project;

CREATE TABLE  Employee
(Employee_ID NUMBER (5) NOT NULL,
Fname VARCHAR2(50) NOT NULL,
Lname VARCHAR2(50) NOT NULL,
SSN VARCHAR2(11) NOT NULL,
DOB DATE NOT NULL,
Phone VARCHAR2(15) NOT NULL,
Address VARCHAR2(255) NOT NULL,
Sex VARCHAR2(1) NOT NULL,
Branch_ID NUMBER(5),
PRIMARY KEY (Employee_ID),
FOREIGN KEY (Branch_ID) REFERENCES Branch (Branch_ID))
tablespace project;

CREATE TABLE Insurance
(Ins_ID NUMBER(5) NOT NULL,
Ins_name VARCHAR2(255) NOT NULL,
Phone NUMBER(15),
Address VARCHAR2(255),
PRIMARY KEY (Ins_ID))
tablespace project;

CREATE TABLE Room
(Room_Number NUMBER(2) NOT NULL,
Branch_ID NUMBER(5) NOT NULL,
PRIMARY KEY (Room_Number, Branch_ID),
FOREIGN KEY (Branch_ID) REFERENCES Branch (Branch_ID))
tablespace project;

CREATE TABLE Nurse
(Nurse_ID NUMBER(5) NOT NULL,
Employee_ID NUMBER(5),
PRIMARY KEY (Nurse_ID),
FOREIGN KEY (Employee_ID) REFERENCES Employee (Employee_ID))
tablespace project;

CREATE TABLE Doctor
(Doctor_ID NUMBER(5) NOT NULL,
Speciality VARCHAR2(255),
Employee_ID NUMBER(5),
PRIMARY KEY (Doctor_ID),
FOREIGN KEY (Employee_ID) REFERENCES Employee (Employee_ID))
tablespace project;

CREATE TABLE Patient
(Patient_ID NUMBER(5) NOT NULL,
SSN VARCHAR2(11) NOT NULL,
Fname VARCHAR2(50) NOT NULL,
Lname VARCHAR2(50) NOT NULL,
DOB date NOT NULL,
Sex VARCHAR2(1) NOT NULL,
Phone VARCHAR2(15) NOT NULL,
Address VARCHAR2(255) NOT NULL,
Ins_ID NUMBER(5),
PRIMARY KEY (Patient_ID),
FOREIGN KEY (Ins_ID) REFERENCES Insurance (Ins_ID))
tablespace project;

CREATE TABLE Prescription
(Prescription_ID NUMBER(5) NOT NULL,
PDate date NOT NULL,
Drug VARCHAR2(50) NOT NULL,
Dosage VARCHAR2(50) NOT NULL,
Refills NUMBER(2) NOT NULL,
Patient_ID NUMBER(5),
Doctor_ID NUMBER(5),
PRIMARY KEY (Prescription_ID),
FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID),
FOREIGN KEY (Doctor_ID) REFERENCES Doctor (Doctor_ID))
tablespace project;

CREATE TABLE Vaccine
(Vac_ID NUMBER(5) NOT NULL,
Vac_name VARCHAR2(50) NOT NULL,
VDate date NOT NULL,
Patient_ID NUMBER(5),
Nurse_ID NUMBER(5),
PRIMARY KEY (Vac_ID),
FOREIGN KEY (Nurse_ID) REFERENCES Nurse (Nurse_ID),
FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID))
tablespace project;

CREATE TABLE Bill
(Bill_ID NUMBER(5) NOT NULL,
Amount DECIMAL(10,2) NOT NULL,
Description VARCHAR2(255),
Paid VARCHAR2(3),
Patient_ID NUMBER(5),
PRIMARY KEY (Bill_ID),
FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID))
tablespace project;

CREATE TABLE Appointment
(Diagnosis VARCHAR2(255),
Procedure VARCHAR2(255),
ADate date NOT NULL,
Doctor_ID NUMBER(5),
Nurse_ID NUMBER(5),
Patient_ID NUMBER(5),
Room_Number NUMBER(2),
Branch_ID NUMBER(5),
FOREIGN KEY (Doctor_ID) REFERENCES Doctor (Doctor_ID),
FOREIGN KEY (Nurse_ID) REFERENCES Nurse (Nurse_ID),
FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID),
FOREIGN KEY (Room_Number, Branch_ID) REFERENCES Room (Room_Number, Branch_ID))
tablespace project;

CREATE TABLE Health_History
(Problem_Name VARCHAR2(50) NOT NULL,
Description VARCHAR2(255) NOT NULL,
Patient_ID NUMBER(5),
PRIMARY KEY (Problem_Name, Patient_ID),
FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID))
tablespace project;
