class Transaction < ApplicationRecord
  has_many :group_transactions, dependent: :destroy
  has_many :groups, through: :group_transactions
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  validates_presence_of :name
  validates :amount, presence: true, numericality: { less_than: 1_000_000_000, greater_than: 0 }
end
