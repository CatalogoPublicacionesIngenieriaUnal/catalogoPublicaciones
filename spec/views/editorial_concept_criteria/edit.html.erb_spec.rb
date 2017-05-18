require 'rails_helper'

RSpec.describe "editorial_concept_criteria/edit", type: :view do
  before(:each) do
    @editorial_concept_criterium = assign(:editorial_concept_criterium, EditorialConceptCriterium.create!(
      :criterium => "MyString"
    ))
  end

  it "renders the edit editorial_concept_criterium form" do
    render

    assert_select "form[action=?][method=?]", editorial_concept_criterium_path(@editorial_concept_criterium), "post" do

      assert_select "input#editorial_concept_criterium_criterium[name=?]", "editorial_concept_criterium[criterium]"
    end
  end
end
