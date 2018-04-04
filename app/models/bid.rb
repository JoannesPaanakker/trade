class Bid < ApplicationRecord
  has_one :order
  belongs_to :user, foreign_key: "userbuy_id"
  belongs_to :stockitem
end
