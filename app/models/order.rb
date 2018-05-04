class Order < ApplicationRecord
  belongs_to :stockitem
  belongs_to :bid
  has_one :orderstatus


  monetize :order_price_cents
end
