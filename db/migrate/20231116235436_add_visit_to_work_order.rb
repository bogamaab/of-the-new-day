class AddVisitToWorkOrder < ActiveRecord::Migration[7.1]
  def change
    add_reference :work_orders, :visit, null: true, foreign_key: true, index: { unique: true }
  end
end
