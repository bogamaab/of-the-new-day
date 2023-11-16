class ChangeReferenceInVisit < ActiveRecord::Migration[7.1]
  def change
    remove_index(:visits, :work_order_id)
    add_index(:visits, :work_order_id, unique: true)
  end
end
