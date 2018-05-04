class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :order
  has_one :stockitem, through: :order
  monetize :amount_cents
end
