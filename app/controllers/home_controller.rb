class HomeController < ApplicationController
  layout "unal", only: [:index,:contact,:historical,:exams_and_juries,:test_exams]

  #skip_before_action :authenticate_someone, only: [:index]

  def index
    @content = "home/index_content.html.erb"
  end

end
