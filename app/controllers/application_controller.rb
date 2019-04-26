class ApplicationController < ActionController::Base
  before_action do
    if current_user == nil
      session_name = "Login"
      session_link = new_user_session_path
    else
      session_name = "Logout"
      session_link = destroy_user_session_path
    end
    @nav_links = {
      "Home" => '/',
      "About Us" => about_path,
      "Meet the Team" => team_path,
      "Get Involved" => participate_path,
      "FAQ" => faq_path,
      "Blog" => blog_path,
      "Contact Us" => contact_path,
      "Donate" => donation_path,
      "Apply for Bail" => application_path,
      session_name => session_link
    }
  end
end
