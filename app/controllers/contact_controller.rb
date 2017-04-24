class ContactController < ApplicationController
  layout "unal"

  def contact
    @content = "contact/contact_content.html.erb"
  end
  
end
