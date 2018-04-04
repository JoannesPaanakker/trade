class Order < ApplicationRecord
  belongs_to :stockitem
  belongs_to :bid
end
