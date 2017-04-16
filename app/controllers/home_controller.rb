class HomeController < ApplicationController
  layout "unal"

  skip_before_action :authenticate_someone!, only: [:index]
  
  def index
    @content = "home/index_content.html.erb"
  end

end
