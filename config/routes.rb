Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "invoices#index"
  resources :invoices 
  resources :payments

end
# payment:
#   id: integer
#   invoice_id: integer
#   payment_method_id: integer 
#   amount: integer (in pennies)
#   created_at: datetime
#   updated_at: datetime
