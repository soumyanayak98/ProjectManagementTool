require 'rails_helper'

RSpec.describe FeaturesController, type: :controller do
  project = Project.first
  describe "POST /create" do
    it "should create a new feature" do
      post :create, params: { feature: {
        title: "Feature Title", description: "Feature description", category_id: 1, id: 1, project_id: project.id
      }, format: "js"}
      expect(response).to have_http_status(:created)
    end
  end
end