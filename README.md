# README

This app is a rudimentary system concept for healthcare providers to track the medications that their patients are prescribed, and automatically see information about potential adverse medication interactions if they exist for the medications prescribed to a patient. Proof-of-concept only for coursework requirement purposes, and is not intended to store real-life data, or be even remotely HIPAA-compliant. Not for any "real" data!

This application was developed with Ruby 2.6.1 and Rails 5.2.4.2.

Native user creation with secure password storage via Bcrypt gem.

Third-party authentication with Google via OmniAuth. It's highly doubtable that G-auth would be acceptable for a real-world healthcare app, but, as mentioned previously, this is merely proof-of-concept. 

For simplicity's sake, Patients belong to one Provider, while Providers can have many Patients. Leaving many-to-many relationship to the Prescriptions for now.

*(See model relationship chart at end of file)*

All views beyond login and account creation are protected behind active-session verification.

Providers create their own Patients exclusively. Information about a Patient, including Prescriptions, can be changed only by the Patient's Provider. Patients are validated for all attribute presence, DOB format, and uniqueness of first/last/DOB combination. If a Patient is destroyed, associated Prescriptions are destroyed as well.

Providers creating accounts via Google authentication, which obviously does not include post-nominals (e.g., D.M.D.), or may have a different or incomplete version of their name, can add their post-nominals or edit their name via edit_user path.

Medications are a simple table model; Prescriptions are a join model between Patients and Medications that include further attributes of dose and frequency. There could be many more attributes like start date, length, etc, but keeping it simple for MVP.

Medication creation is not blatantly "user-facing" as the Medication table is more of a dictionary, theoretically maintained managerially, not by end users. Medication generic names are downcased (as per industry standard) and validated for uniqueness before saving. Generic names are recapitalized for presentation as appropriate. Medication creation is validated for uniqueness by name. Medications could have a slew more attributes, but again, simple for MVP.

A Patient cannot be prescribed the same drug more than once concurrently; Prescriptions are validated for uniqueness by medication as scoped by patient.

The database includes a small table of potentially severe drug interactions. Almost all the available medications interact with one or more of the other available medications. The Interaction model is a self-join between medication_id and medication_id, with an extra attribute of description. 

Potential interactions are identified for a patient by:

1. collecting the medication ids from the patient's prescriptions, eg [1, 2, 3, 4];
2. returning an array of all possible pairings of the above, e.g. [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]];
3. comparing the above pairings to the pairs in the Interaction table, returning an array of Interaction objects (if any);
4. display the matched Interactions on the patient show view.

Cheat Sheet to trigger Interactions:

* lisinopril and spironolactone
* digoxin and amiodarone
* digoxin and verapamil
* theophylline and amiodarone
* theophylline and ciprofloxacin
* warfarin and azithromycin
* warfarin and ibuprofen
* warfarin and phenytoin
* warfarin and ciprofloxacin
* fluoxetine and phenelzine
* fluoxetine and ibuprofen
* sildenafil and amlodipine
* bromocriptine and pseudophedrine
* clonidine and propanolol
* tamoxifen and fluoxetine
* clarithromycin and amlodipine
* warfarin and acetaminophen
* levothyroxine and omeprazole
* clopidogrel and omeprazole

## Domain Model
![domain model](/erd.png)

User (a/k/a Provider)
- have many Patients

Patient
- belongs to User
- has many Prescriptions
- has many Medications, through Prescriptions

Medication
- has many Prescriptions
- has many Patients, through Prescriptions
- has many Interactions

Prescription
- belongs to Patient
- belongs to Medication

Interaction
- belongs to Medication (x2, self-join style)