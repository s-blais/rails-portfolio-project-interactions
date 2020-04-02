# To Do


Models

* Provider (this will be the user that logs in)
	* has_many patients
* Patient
	* belongs_to provider
	* has\_many medications through medications\_patients
* Medication
	* has\_many patients through medications\_patients
* MedicationsPatients
	* belongs\_to patient
	* belongs\_to medication
* Condition (maybe)
* ConditionsPatients (maybe)
* Interactions (med/med/description, or med\_id\_array/description?). This is like a dictionary
* Add #interactions method to return array of interaction ids like @patient.interactions => [2, 4, 7]

Provide standard & omniauth login for providers
providers can create patients and assign medications (and conditions) to patients

Providers and Patients _could_ be a many-to-many relationship, but... that would shift that relationship to another join table, e.g. PatientsProviders

Medication table could include a prescribing provider id, to complement a provider/patient many-to-many






