class AddMaterialToVisit < ActiveRecord::Migration[7.1]
  def change
    add_reference :visits, :material, null: false, foreign_key: true, index: true
  end
end
