require 'support/controller_macros'
require 'rails_helper'

RSpec.describe HomeController do

  login_professor

  it "should have a current_professor" do
    # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
    expect(subject.current_professor).to_not eq(nil)
  end

  it "should get index as professor" do
    # Note, rails 3.x scaffolding may add lines like get :index, {}, valid_session
    # the valid_session overrides the devise login. Remove the valid_session from your specs
    get 'index'
    response.should be_success
  end

  login_administrator

  it "should have a current_administrator" do
    # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
    expect(subject.current_professor).to_not eq(nil)
  end

  it "should get index as administrator" do
    # Note, rails 3.x scaffolding may add lines like get :index, {}, valid_session
    # the valid_session overrides the devise login. Remove the valid_session from your specs
    get 'index'
    response.should be_success
  end

end
