class Bill < ApplicationRecord
  before_create :set_defaults

  validates :reference, presence: true
  validates :amount, presence: true

  def set_defaults
    self.approved = false
  end
end
