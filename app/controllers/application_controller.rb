include Rails.application.routes.url_helpers

class ApplicationController < ActionController::Base
  @@nav_links = {
    "Home" => root_path,
    "About Us" => about_path,
    "Meet the Team" => team_path,
    "Get Involved" => participate_path,
    "FAQ" => faq_path,
    "Blog" => blog_path,
    "Contact Us" => contact_path,
    "Donate" => donation_path,
    "Apply for Bail" => application_path
  }

  before_action do
    @nav_links = @@nav_links
  end
end
