class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :reviews
  has_and_belongs_to_many :adventures
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
