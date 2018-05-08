class Order < ApplicationRecord
  belongs_to :stockitem
  belongs_to :bid
  belongs_to :orderstatus

  monetize :order_price_cents
end
