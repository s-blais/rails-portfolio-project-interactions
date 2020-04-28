# README

This app is a rudimentary system concept for healthcare providers to track the medications that their patients are prescribed. Proof-of-concept only for coursework requirement purposes, and is not intended to store real-life data or be even remotely HIPAA-compliant. It's all for pretend, for school, for fun!

This application was developed with Ruby 2.6.1 and Rail 5.2.4.2.

Native user creation with secure password storage via bcrypt.

Third-party authentication with Google via OmniAuth. Highly doubt G-auth would be acceptable for a real-world healthcare app, but, as mentrioned previously, this is merely proof-of-concept. 

For simplicity's sake, Patients belong to one Provider, while Providers can have many Patients. 

All views beyond login and account creation are protected behind active session verification.

Providers create their Patients. Information about a Patient, including Prescriptions, can be changed only by the Patient's Provider. 

Medications are a simple table model; Prescriptions are a join model between Patients and Medications that include further attributes of dose and frequency.

Providers creating accounts via Google authentication, which obviously does not include post-nominals (e.g., D.M.D.), or may have a different or incomplete version of their name, can add their post-nominals or edit their name via edit_user path.

