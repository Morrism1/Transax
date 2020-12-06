class User < ApplicationRecord
  has_many :transactions, foreign_key: 'author_id', dependent: :destroy
  has_many :groups, foreign_key: 'user_id', dependent: :destroy

  before_save { self.name = name.downcase }
  validates :name, presence: true, uniqueness: true, length: { minimum: 4 }
end
