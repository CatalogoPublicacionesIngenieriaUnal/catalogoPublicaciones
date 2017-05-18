require 'rails_helper'

RSpec.describe "editorial_concept_criteria/show", type: :view do
  before(:each) do
    @editorial_concept_criterium = assign(:editorial_concept_criterium, EditorialConceptCriterium.create!(
      :criterium => "Criterium"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Criterium/)
  end
end
