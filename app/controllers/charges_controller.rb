class ChargesController < ApplicationController
  def create
     # Creates a Stripe Customer object, for associating with the charge
     customer = Stripe::Customer.create(
       email: current_user.email,
       card: params[:stripeToken]
     )
   
     # Charge the user with stripe
     charge = Stripe::Charge.create(
       customer: customer.id, # Note -- this is NOT the user_id in your app
       amount: Amount.default,
       description: "Cogniden Premium Membership - #{current_user.email}",
       currency: 'usd'
     )
   
     flash[:notice] = "Thank you for the payment, #{current_user.email}. You're now a premium member!"
     current_user.add_role :premium
     redirect_to wikis_path
   
     # Rescue Stripe Errors
     rescue Stripe::CardError => e
       flash[:alert] = e.message
       redirect_to new_charge_path
  end
  
  def new
     @stripe_btn_data = {
       key: "#{ Rails.configuration.stripe[:publishable_key] }",
       description: "Cogniden Premium Membership - #{current_user.email}",
       amount: Amount.default
     }
  end
  
  def downgrade
    current_user.remove_role :premium
    Wiki.downgrade(current_user)
    flash[:notice] = "Awww! You've been downgraded to a standard user.Your private wikis will be made public!"
    redirect_to root_path
  end
end