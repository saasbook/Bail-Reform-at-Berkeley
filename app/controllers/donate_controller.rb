class DonateController < ApplicationController
  def new
  end

  def create
    Stripe.api_key = 'sk_test_4eC39HqLyjWDarjtT1zdp7dc'
    token = params[:stripeToken]
    amt = params[:amount]

    begin
      charge = Stripe::Charge.create({
          amount: amt,
          currency: 'usd',
          description: 'Bail Reform at Berkely Donation',
          source: token,
      })
      flash[:notice] = "Thank you for your donation."
      redirect_to '/'
    rescue
      flash[:notice] = "Something went wrong."
      redirect_to new_donation_path
    end
  end
end
