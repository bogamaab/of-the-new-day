class CreateTypeMaterials < ActiveRecord::Migration[7.1]
  def change
    create_table :type_materials do |t|
      t.string :code
      t.string :unit
      t.string :name

      t.timestamps
    end
  end
end
