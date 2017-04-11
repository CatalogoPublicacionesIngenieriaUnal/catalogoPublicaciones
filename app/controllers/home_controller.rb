class HomeController < ApplicationController
  layout "unal"

  def index
    @content = "home/index_content.html.erb"
  end

end
