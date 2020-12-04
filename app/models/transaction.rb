class Transaction < ApplicationRecord
  has_many :group_transactions, dependent: :destroy
  has_many :groups, through: :group_transactions
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  validates_presence_of :name, :amount
end
