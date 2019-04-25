class ApplicationController < ActionController::Base
  before_action do
    @nav_links = {
      "Home" => '/',
      "About Us" => about_path,
      "Meet the Team" => team_path,
      "Get Involved" => participate_path,
      "FAQ" => faq_path,
      "Blog" => blog_path,
      "Contact Us" => contact_path,
      "Donate" => donation_path,
      "Apply for Bail" => application_path
    }
    @logged_in = session[:logged_in].nil? ? false : session[:logged_in]
  end
end
