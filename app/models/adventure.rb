class Adventure < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  has_many :reviews
  has_attached_file :photo, :styles => { :medium => "300x300", :thumb => "100x100"}
   validates_attachment_content_type :photo,
                                    :content_type => /^image\/(png|gif|jpeg)/,
                                    :message => 'only (png/gif/jpeg) images'

  def self.search_model(target_state,target_category)
    # the blank selection is set to 'false' in the select menue. Cannot pass booleans through params
    if target_state != 'false' && target_category == 'false'
      where('state = ?', target_state)
    elsif target_category != 'false' && target_state == 'false'
      where('category = ?', target_category)
    elsif target_state != 'false' && target_category != 'false'
      where('state = ? AND category = ?', target_state, target_category)
    else
      scoped
    end
    # if target_state && target_category
    #   where('state = ? AND category = ?', target_state, target_category)
    # elsif target_state
    #   where('state = ?', target_state)
    # elsif target_category
    #   where('category = ?', target_category)
    # else
    #   scoped
    # end
  end
end
