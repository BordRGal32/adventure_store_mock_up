class AddCategoryColumnToAdventures < ActiveRecord::Migration
  def change
    add_column :adventures, :category, :string
  end
end
