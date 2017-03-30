class HomeController < ApplicationController
  layout "unal", only: [:index,:contact,:historical,:exams_and_juries,:test_exams]

  def index
    @content = "home/index_content.html.erb"
  end

  def contact
    @content = "home/contact_content.html.erb"
  end
end
