# Medical-Clinic-database
DB: MySQL
Languages: JavaScript, CSS, HTML, C# (we might have to use)
	
Patients:
 	Personal info: FirstName, LastName, DOB, Gender, Race, Contact Information, Address, Emergency Contact, Height, Weight
	PatientID
 	InsuranceInfo
  	MedicalHistory: Previous diagnoses, surgeries, medication, allergies
   	HIPAAConsentStatus
    HIPAAConsentDate

Appointments:
	AppointmentID
 	Date/Time
  	Doctor
   	ReasonForVisit
    AppointmentStatus
    FollowUp 

Employees:
	Personal info: FirstName, LastName, DOB, Gender, Race, Contact Information, Address, Emergency Contact, Marital Status, Dependents
    EmployeeID
    Position(Receptionist, Nurse, Doctor, Specialist, Janitor)
    HireDate
    Salary
    Schedule
    CertificationsTrainings

Billing:
	Invoices
 	Payments: Payment Method, AMTbyInsurance, Date/Time, Total
	InsuranceClaims

Inventory:
	Medicine: Type, Amount, ExpirationDate
 	MedicalEquip
  	OfficeSupplies

Audit Log:
	EmployeeID
	CreatedBy
	CreatedAt
	UpdatedBy
	UpdatedAt

Communication Log, Reporting & Analysis
	PatientID
	CommID
	CommType
	CommDetails
	CommTimeStamp
	EmployeeID
	ResponseTime
	FollowUp
	
Use clear words when committing to help the team or anyone else understand what we did.
