class Region < ApplicationRecord
  has_many :users
  has_one :shoesize
end
