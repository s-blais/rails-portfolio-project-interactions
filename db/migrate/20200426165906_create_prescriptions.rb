class CreatePrescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :prescriptions do |t|
      t.references :medication, foreign_key: true
      t.references :patient, foreign_key: true
      t.string :dose
      t.string :frequency

      t.timestamps
    end
  end
end
