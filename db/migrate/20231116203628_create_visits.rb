class CreateVisits < ActiveRecord::Migration[7.1]
  def change
    create_table :visits do |t|
      t.string :timeslots
      t.datetime :start_visit
      t.datetime :end_visit
      t.boolean :reschedule, default: false
      t.integer :quality, default: 0

      t.references :client, null: false, foreign_key: true, index: true
      t.references :work_order, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
