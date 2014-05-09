class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating, :limit => 5
      t.text :comment
      t.belongs_to :user
      t.belongs_to :adventure

      t.timestamps
    end
  end
end
