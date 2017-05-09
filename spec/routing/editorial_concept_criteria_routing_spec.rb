require "rails_helper"

RSpec.describe EditorialConceptCriteriaController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/editorial_concept_criteria").to route_to("editorial_concept_criteria#index")
    end

    it "routes to #new" do
      expect(:get => "/editorial_concept_criteria/new").to route_to("editorial_concept_criteria#new")
    end

    it "routes to #show" do
      expect(:get => "/editorial_concept_criteria/1").to route_to("editorial_concept_criteria#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/editorial_concept_criteria/1/edit").to route_to("editorial_concept_criteria#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/editorial_concept_criteria").to route_to("editorial_concept_criteria#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/editorial_concept_criteria/1").to route_to("editorial_concept_criteria#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/editorial_concept_criteria/1").to route_to("editorial_concept_criteria#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/editorial_concept_criteria/1").to route_to("editorial_concept_criteria#destroy", :id => "1")
    end

  end
end
