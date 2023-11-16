class CreateEquipment < ActiveRecord::Migration[7.1]
  def change
    create_table :equipment do |t|
      t.string :serial
      t.references :type_equipment, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
