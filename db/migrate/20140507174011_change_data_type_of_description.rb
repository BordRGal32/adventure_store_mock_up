class ChangeDataTypeOfDescription < ActiveRecord::Migration
  def change
    remove_column :adventures, :description
    add_column :adventures, :description, :text
  end
end
