class Group < ApplicationRecord
  mount_uploader :icon, GroupIconUploader

  belongs_to :user
  has_many :group_transactions, dependent: :destroy
  has_many :transactions, through: :group_transactions, source: :deal

  validates :name, presence: true, uniqueness: true
end
