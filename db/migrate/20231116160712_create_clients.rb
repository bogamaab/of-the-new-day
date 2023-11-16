class CreateClients < ActiveRecord::Migration[7.1]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :account_number
      t.string :contact_number
      t.references :city, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
