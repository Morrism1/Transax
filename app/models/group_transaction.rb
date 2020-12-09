class GroupTransaction < ApplicationRecord
  belongs_to :group
  belongs_to :deal, foreign_key: :transaction_id, class_name: 'Transaction'
end
