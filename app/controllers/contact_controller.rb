class ContactController < ApplicationController
  layout "unal", only: [:index,:contact,:historical,:exams_and_juries,:test_exams]

  def contact
    @content = "contact/contact_content.html.erb"
  end
end
