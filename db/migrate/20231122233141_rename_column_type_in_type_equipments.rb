class RenameColumnTypeInTypeEquipments < ActiveRecord::Migration[7.1]
  def change
    rename_column :type_equipments, :type, :equipment_type
  end
end
