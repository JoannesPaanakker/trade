class Stockitem < ApplicationRecord
  belongs_to :user, foreign_key: "usersell_id"
  belongs_to :catalogitem
  has_many :bids
  has_one :order
end
