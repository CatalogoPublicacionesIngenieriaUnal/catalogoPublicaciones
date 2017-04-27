require 'rails_helper'

RSpec.describe "criteria/index", type: :view do
  before(:each) do
    assign(:criteria, [
      Criterium.create!(
        :criterion => "Criterion",
        :type => 2
      ),
      Criterium.create!(
        :criterion => "Criterion",
        :type => 2
      )
    ])
  end

  it "renders a list of criteria" do
    render
    assert_select "tr>td", :text => "Criterion".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
