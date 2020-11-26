class Transaction < ApplicationRecord
  belongs_to :group, optional: true
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :groups

  validates_presence_of :name, :amount
end
