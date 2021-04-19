class PaymentsController < ApplicationController
  def create
    @invoice = Invoice.find(params[:payment][:invoice_id])
    payment_method = params[:payment][:payment_method]
    updated_params = payment_params.merge(:payment_method_id => Payment.set_payment_method_id(payment_method)).except("payment_method")
    @payment = @invoice.payments.new(updated_params)
    if @payment.save
      render :json => @payments
    else
      render :json => { :errors => @payments.errors.full_messages }
    end
  end

  private
  def payment_params
    params.require(:payment).permit(:amount, :invoice_id, :payment_method)
  end
end
