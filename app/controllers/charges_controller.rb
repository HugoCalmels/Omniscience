class ChargesController < ApplicationController

  def new
  end
  
  def create
    @stripe_amount = 500
begin
  customer = Stripe::Customer.create({
  email: params[:stripeEmail],
  source: params[:stripeToken],
  })
  charge = Stripe::Charge.create({
  customer: customer.id,
  amount: @stripe_amount,
  description: "Achat d'un produit",
  currency: 'eur',
  })
rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_order_path
end
  end

end
