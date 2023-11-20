class RemoveVisitAssociationInWorkerOrders < ActiveRecord::Migration[7.1]
  def up
    remove_reference :work_orders, :visit, foreign_key: true, index: true
  end

  def down
    add_reference :work_orders, :visit, null: true, foreign_key: true, index: { unique: true }
  end
end
