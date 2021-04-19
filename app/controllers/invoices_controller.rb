class InvoicesController < ApplicationController
  def index
    invoices = Invoice.all.order(created_at: :desc)
    render json: invoices
  end

  def create
    invoice = Invoice.create!(invoice_params)
    if invoice
      render json: invoice
    else
      render json: invoice.errors.full_messages
    end
     @full_paid = Invoice.fully_paid?
  end

  def show 
    invoice = Invoice.find(params[:id])
  end

  private
  def invoice_params
    params.require(invoice).permit(:invoice_total)
  end

end
