class AddDueOnToBooks < ActiveRecord::Migration
  def change
    add_column :books, :due_on, :date
  end
end
