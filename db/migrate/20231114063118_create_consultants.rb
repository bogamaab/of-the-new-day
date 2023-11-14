class CreateConsultants < ActiveRecord::Migration[7.1]
  def change
    create_table :consultants do |t|
      t.references :user, null: false, foreign_key: true, index: { unique: true }

      t.timestamps
    end
  end
end
