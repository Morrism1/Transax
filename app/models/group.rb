class Group < ApplicationRecord
  mount_uploader :icon, GroupIconUploader

  belongs_to :user
  has_many :transactions, dependent: :destroy
end
