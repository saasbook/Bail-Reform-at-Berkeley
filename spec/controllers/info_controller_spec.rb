require 'rails_helper'

describe InfoController do
  it "should get index" do
    get :index
    response.should render_template(:index)
  end
end
