class Transaction < ApplicationRecord
  belongs_to :group, optional: true
  belongs_to :user
  has_many :groups

  validates_presence_of :name, :amount
end
