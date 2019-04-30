class ApplyController < ApplicationController
  def index
  end

  def new
  end

  def apply_bail
    flash[:notice] = "Your form was submitted"
    redirect_to '/'
  end

end
