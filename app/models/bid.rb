class Bid < ApplicationRecord
  belongs_to :userbuy
  belongs_to :stockitem
end
