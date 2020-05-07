# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Medication.find_or_create_by(name: 'lisinopril') do |m|
#    m.trade_names = 'Prinivil, Zestril'
# end
# Medication.find_or_create_by(name: 'spironolactone') do |m|
#   m.trade_names = 'Aldactone, Spiractin, Verospiron'
# end
# Medication.find_or_create_by(name: 'digoxin') do |m|
#   m.trade_names = 'Lanoxin'
# end
# Medication.find_or_create_by(name: 'amiodarone') do |m|
#   m.trade_names = 'Cardarone, Nexterone'
# end
# Medication.find_or_create_by(name: 'theophylline') do |m|
#   m.trade_names = 'Theolair, Slo-Bid'
# end
# Medication.find_or_create_by(name: 'ciprofloxacin') do |m|
#   m.trade_names = 'Ciloxan, Cipro, Neofloxin'
# end
# Medication.find_or_create_by(name: 'warfarin') do |m|
#   m.trade_names = 'Coumadin'
# end
# Medication.find_or_create_by(name: 'azithromycin') do |m|
#   m.trade_names = 'Zithromax, Azithrocin'
# end
# Medication.find_or_create_by(name: 'ibuprofen') do |m|
#   m.trade_names = 'Advil, Motrin, Nurofen'
# end
# Medication.find_or_create_by(name: 'phenytoin') do |m|
#   m.trade_names = 'Dilantin'
# end
# Medication.find_or_create_by(name: 'fluoxetine') do |m|
#   m.trade_names = 'Prozac, Sarafem, Adofen'
# end
# Medication.find_or_create_by(name: 'sildenafil') do |m|
#   m.trade_names = 'Viagra, Revatio'
# end
# Medication.find_or_create_by(name: 'isosorbide mononitrate') do |m|
#   m.trade_names = 'Monoket, Imdur'
# end
# Medication.find_or_create_by(name: 'amlodipine') do |m|
#   m.trade_names = 'Norvasc'
# end
# Medication.find_or_create_by(name: 'bromocriptine') do |m|
#   m.trade_names = 'Parlodel'
# end
# Medication.find_or_create_by(name: 'pseudophedrine') do |m|
#   m.trade_names = 'Afrinol, Sudafed, Sinutab'
# end
# Medication.find_or_create_by(name: 'clonidine') do |m|
#   m.trade_names = 'Catapres, Kapvay, Nexiclon'
# end
# Medication.find_or_create_by(name: 'propanolol') do |m|
#   m.trade_names = 'Inderal'
# end
# Medication.find_or_create_by(name: 'tamoxifen') do |m|
#   m.trade_names = 'Nolvadex, Genox, Tamifen'
# end
# Medication.find_or_create_by(name: 'clarithromycin') do |m|
#   m.trade_names = 'Biaxin'
# end
# Medication.find_or_create_by(name: 'acetaminphen') do |m|
#   m.trade_names = 'Tylenol, Panadol'
# end
# Medication.find_or_create_by(name: 'levothyroxine') do |m|
#   m.trade_names = 'Synthroid, Levoxyl, Thyrax'
# end
# Medication.find_or_create_by(name: 'omeprazole') do |m|
#   m.trade_names = 'Losec, Prilosec, Zegerid'
# end
# Medication.find_or_create_by(name: 'clopidogrel') do |m|
#   m.trade_names = 'Plavix'
# end

# Interaction.create(medication_1: Medication.find(1), medication_2: Medication.find(2), description: "potential for elevated potassium levels in blood (hyperkalemia)")

# Interaction.create(medication_1: Medication.find(3), medication_2: Medication.find(4), description: "potentially toxic levels of digoxin")

# Interaction.create(medication_1: Medication.find(3), medication_2: Medication.find(32), description: "potentially toxic levels of digoxin, bradycardia")

# Interaction.create(medication_1: Medication.find(4), medication_2: Medication.find(5), description: "theophylline enhancement")

# Interaction.create(medication_1: Medication.find(5), medication_2: Medication.find(8), description: "theophylline toxicity, seizures")

# Interaction.create(medication_1: Medication.find(7), medication_2: Medication.find(8), description: "excessive bleeding")

# Interaction.create(medication_1: Medication.find(4), medication_2: Medication.find(7), description: "gastrointestinal bleeding")
# 9
# Interaction.create(medication_1: Medication.find(7), medication_2: Medication.find(10), description: "bleeding, drowsiness, abnormal gait, confusion")

# Interaction.create(medication_1: Medication.find(6), medication_2: Medication.find(7), description: "decreased warfarin metabolization, excessive bleeding")

# Interaction.create(medication_1: Medication.find(11), medication_2: Medication.find(12), description: "central serotonin syndrome")

# Interaction.create(medication_1: Medication.find(9), medication_2: Medication.find(11), description: "excessive bleeding")

# Interaction.create(medication_1: Medication.find(13), medication_2: Medication.find(14), description: "dangerous / sudden hypotension")

# Interaction.create(medication_1: Medication.find(13), medication_2: Medication.find(15), description: "severe hypotension")

# Interaction.create(medication_1: Medication.find(16), medication_2: Medication.find(17), description: "severe peripheral vasoconstriction, ventricular tachycardia, seizures, death")

# Interaction.create(medication_1: Medication.find(18), medication_2: Medication.find(19), description: "severe, potentially-fatal rebound hypertension")

# Interaction.create(medication_1: Medication.find(11), medication_2: Medication.find(20), description: "decreased effectiveness of tamoxifen")

# Interaction.create(medication_1: Medication.find(15), medication_2: Medication.find(21), description: "hypotension and renal failure")

# Interaction.create(medication_1: Medication.find(7), medication_2: Medication.find(22), description: "gastrointestinal bleeding")

# Interaction.create(medication_1: Medication.find(23), medication_2: Medication.find(24), description: "hyperthyroidism")

# Interaction.create(medication_1: Medication.find(24), medication_2: Medication.find(25), description: "stroke, heart attack")

