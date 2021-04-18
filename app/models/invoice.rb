class Invoice < ApplicationRecord
  # we are sure that we recieve payments in $
  # before_create :translate_invoice_total_to_cents
  attr_accessor :invoice_total

  has_many :payments

  # def fully_paid?
  #   amount_owed == 0
  # end
  # private

  # def translate_invoice_total_to_cents
  #   self.invoice_total * 100
  # end
end
