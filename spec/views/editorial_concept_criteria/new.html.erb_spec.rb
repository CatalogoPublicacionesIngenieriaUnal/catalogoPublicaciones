require 'rails_helper'

RSpec.describe "editorial_concept_criteria/new", type: :view do
  before(:each) do
    assign(:editorial_concept_criterium, EditorialConceptCriterium.new(
      :criterium => "MyString"
    ))
  end

  it "renders new editorial_concept_criterium form" do
    render

    assert_select "form[action=?][method=?]", editorial_concept_criteria_path, "post" do

      assert_select "input#editorial_concept_criterium_criterium[name=?]", "editorial_concept_criterium[criterium]"
    end
  end
end
