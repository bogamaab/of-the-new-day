class AddStateToVisits < ActiveRecord::Migration[7.1]
  def change
    add_column :visits, :status, :integer
  end
end
