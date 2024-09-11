# Medical-Clinic-database
DB: MySQL
Languages: JavaScript, CSS, HTML, C# (we might have to use)

Roles examples: Patients, doctors, receptionist, admins, specialist, nurse.
	All users below: 
		Personal info.
			Personal info: age(DOB), gender, race, home address, emergency contact, insurance.

	Patient:
		Appointment info, their doctor, medical information, bills/payments, health risks/status. (type string)
			Health risks/status: info about behavior and lifestyles (e.g. tobacco use), family history, genetic factors. (type string)
			Medical info: prescriptions, medical history (e.g. previous hospital admissions, surgeries, past medical problems), current health problems/diagnoses, allergies, lab tests/blood work (type string)
			
	Receptionist: 
		Appointment info (e.g. medical department, reason for clinic visit, patient personal info), oustanding bills, payment method and status of payment(pending, partial, term) (type string)

	All users below:
		 Medical records.
			
			schedule (type string)
	Nurse:
 		Day in and out (if need to stay in hospital for treatment) (type int)
   		precription by time, status of patient(include pregnancy)  (type string)
     		
		
	Doctor: part of patient info (type string)
 		Allergy (drugs, nature) (type string)
   		treatment plan (type string)
 		Insurance allowance category(drugs, vaccine) (type string)
	Specialist: 
		
	Admin: Personal info for employees: immediate family, marital status, education, employment info (e.g. hire date, department, specialty). (type string)
		Access to everything, staff schedule, staff/patient demographics, clinic departments info, health insurance info, outcome data.
			Outcome data: info about aftermath of various health problems/surgeries/medicine/complications, satisfaction surveys

Use clear words when committing to help the team or anyone else understand what we did.
