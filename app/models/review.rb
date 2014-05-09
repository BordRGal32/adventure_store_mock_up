class Review < ActiveRecord::Base
  belongs_to :adventure
  belongs_to :user
  validates :comment, presence: true
  validates :rating, presence: true
end
