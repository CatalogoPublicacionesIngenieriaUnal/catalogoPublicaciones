require 'rails_helper'

RSpec.describe "criteria/new", type: :view do
  before(:each) do
    assign(:criterium, Criterium.new(
      :criterion => "MyString",
      :type => 1
    ))
  end

  it "renders new criterium form" do
    render

    assert_select "form[action=?][method=?]", criteria_path, "post" do

      assert_select "input#criterium_criterion[name=?]", "criterium[criterion]"

      assert_select "input#criterium_type[name=?]", "criterium[type]"
    end
  end
end
