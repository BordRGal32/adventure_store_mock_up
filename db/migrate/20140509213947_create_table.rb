class CreateTable < ActiveRecord::Migration
  def change
    create_table :adventures_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :adventure

    end
  end
end
