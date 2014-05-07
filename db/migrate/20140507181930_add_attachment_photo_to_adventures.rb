class AddAttachmentPhotoToAdventures < ActiveRecord::Migration
  def self.up
    change_table :adventures do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :adventures, :photo
  end
end
