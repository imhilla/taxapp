class Payment < ApplicationRecord
  belongs_to :invoice
  
  validates :payment_method_id, inclusion: { in: [1, 2, 3], message: "Payment method id invalid" }
  validates :payment_method_id, presence: true
  validates :amount, presence: true

  METHODS = { cash: 1, check: 2, charge: 3 }

  def self.set_payment_method_id(payment_method)
    METHODS[payment_method.to_sym]
  end
end
