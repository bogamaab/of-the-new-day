class CreateTypeEquipments < ActiveRecord::Migration[7.1]
  def change
    create_table :type_equipments do |t|
      t.string :name
      t.string :type

      t.timestamps
    end
  end
end
