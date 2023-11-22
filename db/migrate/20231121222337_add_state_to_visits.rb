class AddStateToVisits < ActiveRecord::Migration[7.1]
  def up
    add_column :visits, :state, :string
    add_index :visits, :state
    execute "UPDATE visits SET state = 'assign';"
  end

  def down
    remove_index :visits, :state
    remove_column :visits, :state
  end
end
