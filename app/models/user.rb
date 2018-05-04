class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :stockitems
  has_many :bids
  has_many :orders, through: :stockitem
  has_many :orders, through: :bid
  belongs_to :region, optional: true
  has_many :transactions

  validates :email, presence: true
end
