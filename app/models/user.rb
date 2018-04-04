class User < ApplicationRecord
  has_many :stockitems
  has_many :bids
end
