class Order < ApplicationRecord
  belongs_to :stockitem
  belongs_to :userbuy
  belongs_to :usersell
end
