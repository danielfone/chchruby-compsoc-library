class AddLimitToBorrowers < ActiveRecord::Migration
  def change
    add_column :borrowers, :limit, :integer
  end
end
