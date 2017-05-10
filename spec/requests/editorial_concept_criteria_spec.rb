require 'rails_helper'

RSpec.describe "EditorialConceptCriteria", type: :request do
  describe "GET /editorial_concept_criteria" do
    it "works! (now write some real specs)" do
      get editorial_concept_criteria_path
      expect(response).to have_http_status(200)
    end
  end
end
