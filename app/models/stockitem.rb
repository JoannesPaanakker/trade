class Stockitem < ApplicationRecord
  belongs_to :usersell
  has_many :bids
  has_one :order
end
