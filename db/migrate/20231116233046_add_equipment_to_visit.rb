class AddEquipmentToVisit < ActiveRecord::Migration[7.1]
  def change
    add_reference :visits, :equipment, null: false, foreign_key: true, index: true
  end
end
