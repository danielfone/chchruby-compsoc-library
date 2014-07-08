class AddBorrowerIdToBooks < ActiveRecord::Migration
  def change
    add_column :books, :borrower_id, :integer
    add_index :books, :borrower_id
  end
end
