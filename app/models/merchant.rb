class Merchant < ApplicationRecord
  has_many :cards, dependent: :destroy
  has_many :purchases, dependent: :destroy
end
