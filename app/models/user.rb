class User < ApplicationRecord
  has_many :stockitems
  has_many :bids
  belongs_to :region
end
