class Bill < ApplicationRecord
  validates :reference, presence: true
  validates :amount, presence: true
end
