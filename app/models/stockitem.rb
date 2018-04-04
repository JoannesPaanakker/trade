class Stockitem < ApplicationRecord
  belongs_to :user, foreign_key: "usersell_id"
  has_many :bids
  has_one :order
end
