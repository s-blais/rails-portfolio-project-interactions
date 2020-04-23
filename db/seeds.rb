# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Medication.find_or_create_by(name: 'lisinopril') do |m|
   m.trade_names = 'Prinivil, Zestril'
end
Medication.find_or_create_by(name: 'spironolactone') do |m|
  m.trade_names = 'Aldactone, Spiractin, Verospiron'
end
Medication.find_or_create_by(name: 'digoxin') do |m|
  m.trade_names = 'Lanoxin'
end
Medication.find_or_create_by(name: 'amiodarone') do |m|
  m.trade_names = 'Cardarone, Nexterone'
end
Medication.find_or_create_by(name: 'theophylline') do |m|
  m.trade_names = 'Theolair, Slo-Bid'
end
Medication.find_or_create_by(name: 'ciprofloxacin') do |m|
  m.trade_names = 'Ciloxan, Cipro, Neofloxin'
end
Medication.find_or_create_by(name: 'warfarin') do |m|
  m.trade_names = 'Coumadin'
end
Medication.find_or_create_by(name: 'azithromycin') do |m|
  m.trade_names = 'Zithromax, Azithrocin'
end
Medication.find_or_create_by(name: 'ibuprofen') do |m|
  m.trade_names = 'Advil, Motrin, Nurofen'
end
Medication.find_or_create_by(name: 'phenytoin') do |m|
  m.trade_names = 'Dilantin'
end
Medication.find_or_create_by(name: 'fluoxetine') do |m|
  m.trade_names = 'Prozac, Sarafem, Adofen'
end
Medication.find_or_create_by(name: 'sildenafil') do |m|
  m.trade_names = 'Viagra, Revatio'
end
Medication.find_or_create_by(name: 'isosorbide mononitrate') do |m|
  m.trade_names = 'Monoket, Imdur'
end
Medication.find_or_create_by(name: 'amlodipine') do |m|
  m.trade_names = 'Norvasc'
end
Medication.find_or_create_by(name: 'bromocriptine') do |m|
  m.trade_names = 'Parlodel'
end
Medication.find_or_create_by(name: 'pseudophedrine') do |m|
  m.trade_names = 'Afrinol, Sudafed, Sinutab'
end
Medication.find_or_create_by(name: 'clonidine') do |m|
  m.trade_names = 'Catapres, Kapvay, Nexiclon'
end
Medication.find_or_create_by(name: 'propanolol') do |m|
  m.trade_names = 'Inderal'
end
Medication.find_or_create_by(name: 'tamoxifen') do |m|
  m.trade_names = 'Nolvadex, Genox, Tamifen'
end
Medication.find_or_create_by(name: 'clarithromycin') do |m|
  m.trade_names = 'Biaxin'
end
Medication.find_or_create_by(name: 'acetaminphen') do |m|
  m.trade_names = 'Tylenol, Panadol'
end
Medication.find_or_create_by(name: 'levothyroxine') do |m|
  m.trade_names = 'Synthroid, Levoxyl, Thyrax'
end
Medication.find_or_create_by(name: 'omeprazole') do |m|
  m.trade_names = 'Losec, Prilosec, Zegerid'
end
Medication.find_or_create_by(name: 'clopidogrel') do |m|
  m.trade_names = 'Plavix'
end
