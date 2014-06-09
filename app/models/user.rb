class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  validates :username, :uniqueness => true, :length => { :in => 2..20 }, 
            :format => { :with => /\A[\u4e00-\u9fa5a-zA-Z0-9]+\z/ }
end
