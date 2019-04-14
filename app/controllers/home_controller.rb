include Rails.application.routes.url_helpers

class HomeController < ApplicationController
  @@nav_links = {
    "Home" => root_path,
    "About Us" => about_path,
    "Meet the Team" => team_path,
    "Get Involved" => volunteer_path,
    "FAQ" => faq_path,
    "Blog" => blog_path,
    "Contact Us" => contact_path
  }

  before_action do
    @nav_links = @@nav_links
  end

  def index
  end

  def about
  end

  def team
  end

  def volunteer
  end

  def faq
  end

  def blog
  end
end
