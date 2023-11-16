class AddDocumentTypeToUser < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :document_type, null: false, foreign_key: true, index: true
  end
end
