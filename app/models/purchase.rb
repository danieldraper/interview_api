class Purchase < ApplicationRecord
  enum state: {
    pending: "pending",
    rejected: "rejected",
    approved: "approved",
  }, _default: :pending

  belongs_to :merchant
  belongs_to :card
end
