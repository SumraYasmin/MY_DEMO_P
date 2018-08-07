class User < ApplicationRecord
  validates :name, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:user, :admin]
  enum status: [:active, :inactive]
  after_initialize :set_default_role, :set_default_status,:set_default_managerrights,  :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  def set_default_status
    self.status ||= :active
  end

   def set_default_managerrights
    self.ismanager= false
  end

   before_create do
    self.name = name.capitalize
  end

end
