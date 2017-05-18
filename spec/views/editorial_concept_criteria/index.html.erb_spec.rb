require 'rails_helper'

RSpec.describe "editorial_concept_criteria/index", type: :view do
  before(:each) do
    assign(:editorial_concept_criteria, [
      EditorialConceptCriterium.create!(
        :criterium => "Criterium"
      ),
      EditorialConceptCriterium.create!(
        :criterium => "Criterium"
      )
    ])
  end

  it "renders a list of editorial_concept_criteria" do
    render
    assert_select "tr>td", :text => "Criterium".to_s, :count => 2
  end
end
