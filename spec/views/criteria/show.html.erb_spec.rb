require 'rails_helper'

RSpec.describe "criteria/show", type: :view do
  before(:each) do
    @criterium = assign(:criterium, Criterium.create!(
      :criterion => "Criterion",
      :type => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Criterion/)
    expect(rendered).to match(/2/)
  end
end
