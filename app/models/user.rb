class User < ApplicationRecord
  after_initialize :set_default_role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def set_default_role
    self.role ||= :employee
  end

  enum role: [:employee, :manager, :admin]
end
