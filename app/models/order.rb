class Order < ApplicationRecord
  belongs_to :stockitem
  belongs_to :bid
  belongs_to :orderstatus
end
