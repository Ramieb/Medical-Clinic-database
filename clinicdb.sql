-- create database clinicdb
CREATE TABLE Office (
    office_id INT PRIMARY KEY,
    location VARCHAR(128),
    admin_id INT,
    admin_start_date DATE,
    FOREIGN KEY (admin_id) REFERENCES Admin(employee_ssn)
);
CREATE TABLE Appointment(
	app_date DATETIME PRIMARY KEY,
    P_ID INT PRIMARY KEY,
    D_ID INT,
    FOREIGN KEY (D_ID) REFERENCES Employee(employee_ssn),
    FOREIGN KEY (P_ID) REFERENCES Patient(patient_id)
);
CREATE TABLE Medication (
    medicine VARCHAR(50) PRIMARY KEY,
    start_date DATE,
    end_date DATE,
    number_to_take SMALLINT,
    time_of_day VARCHAR(20),
    prescribed_by INT,
    prescribed_to INT,
    FOREIGN KEY (prescribed_by) REFERENCES Doctor(employee_ssn),
    FOREIGN KEY (prescribed_to) REFERENCES Patient(patient_id)
);

CREATE TABLE Allergies(
	allergy VARCHAR(20) PRIMARY KEY,
    P_ID INT,
    FOREIGN KEY (P_ID) REFERENCES Patient(patient_id)
);
CREATE TABLE Illness(
	ailment VARCHAR(50) PRIMARY KEY,
    start_date DATE,
    end_date DATE,
    P_ID INT,
    FOREIGN KEY (P_ID) REFERENCES Patient(patient_id)
);
CREATE TABLE Surgery(
	procedure_done VARCHAR(50) PRIMARY KEY,
    body_part VARCHAR(25),
    surgery_date DATE,
    P_ID INT,
    FOREIGN KEY (P_ID) REFERENCES Patient(patient_id)
);
CREATE TABLE Immunization(
	vaccine VARCHAR(50) PRIMARY KEY,
    vax_date DATE,
    P_ID INT,
    FOREIGN KEY (P_ID) REFERENCES Patient(patient_id)
);
CREATE TABLE Med_History(
	P_ID int PRIMARY KEY,
    last_visit DATETIME PRIMARY KEY,
    height SMALLINT,
    weight SMALLINT,
    allergy VARCHAR(20),
    blood_pressure VARCHAR(10),
    prev_prescription VARCHAR(50),
    prev_sickness VARCHAR(50),
    prev_surgeries VARCHAR(50),
    FOREIGN KEY(P_ID) REFERENCES patient(patient_id),
    FOREIGN KEY(prev_prescription) REFERENCES Medication(medicine),
    FOREIGN KEY(allergy) REFERENCES Allergies(allegy),
    FOREIGN KEY(prev_sickness) REFERENCES Illness(ailment),
	FOREIGN KEY(prev_surgeries) REFERENCES Surgery(procedure_done)
);
CREATE TABLE Doctor (
    employee_ssn VARCHAR(9) PRIMARY KEY,
    Admin_ssn VARCHAR(11),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hire_date VARCHAR(10),
    salary INT,
    office_id INT,
    specialty VARCHAR(25),
    FOREIGN KEY (office_id) REFERENCES Office(office_id),
    FOREIGN KEY (Admin_ssn) REFERENCES Admin(employee_ssn)
);

CREATE TABLE Nurse (
    employee_ssn VARCHAR(9) PRIMARY KEY,
    Admin_ssn VARCHAR(11),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hire_date VARCHAR(10),
    salary INT,
    office_id INT,
    FOREIGN KEY (office_id) REFERENCES Office(office_id),
    FOREIGN KEY (Admin_ssn) REFERENCES Admin(employee_ssn)
);
CREATE TABLE Receptionist (
	employee_ssn VARCHAR(9) PRIMARY KEY,
    Admin_ssn VARCHAR(11),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hire_date VARCHAR(10),
    salary INT,
    office_id INT,
    FOREIGN KEY (office_id) REFERENCES Office(office_id),
    FOREIGN KEY (Admin_ssn) REFERENCES Admin(employee_ssn)
);
CREATE TABLE Patient (
    patient_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    address VARCHAR(128),
    phone_number VARCHAR(10),
    primary_id INT,
    FOREIGN KEY (primary_id) REFERENCES Doctor(employee_ssn)
);






CREATE TABLE Admin (
    employee_ssn VARCHAR(9) PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);


INSERT INTO Patient (patient_id, patient_ssn, first_name, last_name, date_of_birth, address, phone_number, doctor_id, appointment_info, medical_information, health_risks_status, bills_payments)
VALUES 
(1, '123-45-6789', 'John', 'Doe', '1980-01-15', '123 Main St, Anytown, USA', '555-1234', 101, 
    JSON_OBJECT('last_appointment', '2023-09-12', 'next_appointment', '2024-01-15'),
    JSON_OBJECT('blood_type', 'O+', 'allergies', JSON_ARRAY('Peanuts', 'Dust')),
    JSON_OBJECT('heart_disease', false, 'diabetes', true),
    JSON_OBJECT('total_bills', 2000, 'paid', 1000)),
(2, '234-56-7890', 'Jane', 'Smith', '1992-04-25', '456 Oak St, Anytown, USA', '555-5678', 102, 
    JSON_OBJECT('last_appointment', '2023-08-30', 'next_appointment', '2024-02-10'),
    JSON_OBJECT('blood_type', 'A-', 'allergies', JSON_ARRAY('Penicillin')),
    JSON_OBJECT('heart_disease', false, 'diabetes', false),
    JSON_OBJECT('total_bills', 500, 'paid', 500));

INSERT INTO Employee (employee_id, employee_ssn, first_name, last_name, role, office_id, receptionist_info, nurse_info, doctor_info, specialist_info)
VALUES 
(101, '345-67-8901', 'Alice', 'Johnson', 'Doctor', 1, NULL, NULL, 
    JSON_OBJECT('specialty', 'Cardiologist', 'years_of_experience', 15), NULL),
(102, '456-78-9012', 'Bob', 'Williams', 'Doctor', 1, NULL, NULL, 
    JSON_OBJECT('specialty', 'General Practitioner', 'years_of_experience', 10), NULL),
(103, '567-89-0123', 'Emily', 'Brown', 'Nurse', 2, NULL, 
    JSON_OBJECT('certifications', JSON_ARRAY('CPR', 'Basic Life Support')), NULL, NULL),
(104, '678-90-1234', 'Michael', 'Davis', 'Receptionist', 2, 
    JSON_OBJECT('desk_number', '5', 'work_hours', '9AM-5PM'), NULL, NULL, NULL),
(105, '789-01-2345', 'Laura', 'Martinez', 'Specialist', 1, NULL, NULL, NULL, 
    JSON_OBJECT('specialty', 'Dermatology', 'years_of_experience', 12));

INSERT INTO Admin (admin_id, admin_ssn, first_name, last_name, employee_info, clinic_operations, insurance_info, outcome_data)
VALUES 
(1, '890-12-3456', 'Sarah', 'Connor', 
    JSON_OBJECT('position', 'Head Admin', 'experience', 8),
    JSON_OBJECT('operation_hours', '8AM-6PM', 'staff_count', 25),
    JSON_OBJECT('insurance_partners', JSON_ARRAY('Aetna', 'Blue Cross')),
    JSON_OBJECT('success_rate', 0.95, 'average_wait_time', '30 minutes'));

INSERT INTO Office (office_id, location, staff, manager_id, admin_start_date)
VALUES 
(1, 'Downtown Clinic, Anytown, USA', 
    JSON_OBJECT('doctors', JSON_ARRAY('Alice Johnson', 'Bob Williams'), 'nurses', JSON_ARRAY('Emily Brown')),
    1, '2020-01-15'),
(2, 'Suburb Clinic, Anytown, USA', 
    JSON_OBJECT('receptionists', JSON_ARRAY('Michael Davis'), 'nurses', JSON_ARRAY('Emily Brown')),
    1, '2020-01-15');

INSERT INTO Treatment (treatment_id, prescription, period, prescribed_by, prescribed_to)
VALUES 
(1, JSON_OBJECT('medication', 'Lisinopril', 'dosage', '20mg', 'frequency', 'Daily'), '2023-09-12', 101, 1),
(2, JSON_OBJECT('medication', 'Ibuprofen', 'dosage', '200mg', 'frequency', 'As needed'), '2023-08-30', 102, 2);
