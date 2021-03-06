class HomeController < ApplicationController
  layout "unal"

  skip_before_action :require_login, only: [:index]

  def index
    @content = "home/index_content.html.erb"
  end

  def under_construction
    @content = "home/under_construction_content"
  end

end
