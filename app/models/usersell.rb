class Usersell < ApplicationRecord
  has_many :stockitems
  has_many :orders
end
