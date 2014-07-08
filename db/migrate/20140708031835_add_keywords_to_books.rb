class AddKeywordsToBooks < ActiveRecord::Migration
  def change
    add_column :books, :keywords, :string
  end
end
