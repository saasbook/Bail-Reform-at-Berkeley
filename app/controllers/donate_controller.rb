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
      redirect_to successful_donation_path
    rescue
      redirect_to failed_donation_path
    end
  end

  def success
  end

  def fail
  end
end
