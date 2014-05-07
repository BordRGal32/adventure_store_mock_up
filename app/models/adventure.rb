class Adventure < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  has_attached_file :photo, :styles => { :medium => "300x300", :thumb => "100x100"}
   validates_attachment_content_type :photo,
                                    :content_type => /^image\/(png|gif|jpeg)/,
                                    :message => 'only (png/gif/jpeg) images'
end
