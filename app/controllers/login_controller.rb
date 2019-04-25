class LoginController < ApplicationController
    def sign_in
        session[:logged_in] = true
        flash[:notice] = "You have been signed in"
        redirect_to "/"
    end

    def sign_out
        flash[:notice] = "You have been signed out"
        session[:logged_in] = false
        redirect_to "/"
    end

    def sign_in_form
        @mid_log_in = true
    end
end