class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :name, :password, :password_confirmation, :score

  validates :password, presence: true, on: :create
  validates :email, presence: true
  validates :email, uniqueness: true

  before_validation :set_default_role
  before_validation :set_default_score

  def role?(role_to_compare)
    self.role.to_s == role_to_compare.to_s
  end

  private
  def set_default_role
    self.role ||= :general
  end

  private
  def set_default_score
    self.score = 0
  end
  
end
