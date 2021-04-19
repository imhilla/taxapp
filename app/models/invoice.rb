class Invoice < ApplicationRecord
  # we are sure that we recieve payments in $
  before_create :translate_invoice_total_to_cents

  has_many :payments

  def fully_paid?
    self.invoice_total == payments.sum(:amount)
  end

  def amount_owed
    self.invoice_total - payments.sum(:amount)
  end

  private
  
  def translate_invoice_total_to_cents
    self.invoice_total = self.invoice_total * 100
  end

end