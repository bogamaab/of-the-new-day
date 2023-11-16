class CreateMaterials < ActiveRecord::Migration[7.1]
  def change
    create_table :materials do |t|
      t.string :amount
      t.references :type_material, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
