require 'rails_helper'

describe DonateController do
  it "should get new" do
    get :new
    response.should render_template(:new)
  end

  it "should redirect on create" do
    get :create, :params => {:stripeToken => "123", :amount => "500"}
    response.should redirect_to(new_donation_path)
  end
end
