class CreateAdventures < ActiveRecord::Migration
  def change
    create_table :adventures do |t|
      t.string :title
      t.string :description
      t.string :state
      t.decimal :price, precision: 5, scale: 2
      t.timestamps
    end
  end
end
