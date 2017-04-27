require 'rails_helper'

RSpec.describe "criteria/edit", type: :view do
  before(:each) do
    @criterium = assign(:criterium, Criterium.create!(
      :criterion => "MyString",
      :type => 1
    ))
  end

  it "renders the edit criterium form" do
    render

    assert_select "form[action=?][method=?]", criterium_path(@criterium), "post" do

      assert_select "input#criterium_criterion[name=?]", "criterium[criterion]"

      assert_select "input#criterium_type[name=?]", "criterium[type]"
    end
  end
end
