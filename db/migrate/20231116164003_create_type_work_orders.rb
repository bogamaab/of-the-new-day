class CreateTypeWorkOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :type_work_orders do |t|
      t.string :description

      t.timestamps
    end
  end
end
