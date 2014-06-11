class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  validates :username, :uniqueness => true, length: { in: 2..20 }, 
            format: { with: /\A[\u4e00-\u9fa5a-zA-Z0-9]+\z/ }

  has_and_belongs_to_many :roles
  has_many :deals, class_name: "Crm::Deal"
  has_many :activities, class_name: "Crm::Activity"
  has_many :contracts, class_name: "Cm:Contract"
  has_many :billings, class_name: "Fm::Billing"
  has_many :smartfinders
  belongs_to :organization

  def in_role?(role)
    if self.roles
      self.roles.collect(&:id).include?(role.to_i)
    end
  end

  def is_super_admin?
    self.id == 1
  end

  def has_role?(role)
    case role
    when :admin then in_role?("1")
    when :super_admin then is_super_admin?
    else false
    end
  end
end