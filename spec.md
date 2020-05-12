# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship: *User has_many Patients, Patient has_many Prescriptions, Medication has_many Patients, Medication has_many Interactions*
- [x] Include at least one belongs_to relationship:  *Patient belongs_to User, Prescription belongs_to Patient, Prescription belongs_to Medication, Interaction belongs_to Medication*
- [x] Include at least two has_many through relationships:  *Patient has_many Medications, through Prescriptions, Medication has_many Patients, through Prescriptions*
- [x] Include at least one many-to-many relationship:  *Patient has_many Medications, through Prescriptions, Medication has_many Patients, through Prescriptions*
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user: *Prescription.dose and Prescription.frequency*
- [x] Include reasonable validations for simple model objects:
  - *User: username: uniqueness, format*
  - *Patient: first_name, last_name: presence; birthdate: format; all three together: uniqueness*
  - *Prescription: medication_id, patient_id, dose, frequency: presence; medication_id: uniqueness (scope: patient_id)*
- [x] Include a class level ActiveRecord scope method: *Patient.provider_scope URL: users/:id/patients*
- [x] Include signup
- [x] Include login
- [x] Include logout
- [x] Include third party signup/login: *OmniAuth/Google*
- [x] Include nested resource show or index: *users/:id/index, patients/:id/prescriptions*
- [x] Include nested resource "new" form: *users/:id/patients/new, patients/:id:/prescriptions/new*
- [x] Include form display of validation errors: *validation errors display for new/edit on user, patient, and prescription forms*

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate

*controllers utilize private before_action helper methods, application_helper.rb methods, and class methods; all form error handling moved to a shared partial; redundant Patient and Prescription new/edit forms moved to partial*