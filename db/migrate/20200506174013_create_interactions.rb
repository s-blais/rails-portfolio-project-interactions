class CreateInteractions < ActiveRecord::Migration[5.2]
  def change
    create_table :interactions do |t|
      t.integer :medication_1_id, foreign_key: true
      t.integer :medication_2_id, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
