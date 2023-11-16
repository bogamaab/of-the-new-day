class CreateWorkOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :work_orders do |t|
      t.string :node
      t.string :failure_note
      t.string :marker, limit: 9
      t.string :closing_note
      t.references :type_work_order, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
