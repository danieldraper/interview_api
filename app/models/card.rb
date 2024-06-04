class Card < ApplicationRecord
  belongs_to :merchant
  has_many :purchases, dependent: :destroy
end
