require 'rails_helper'

RSpec.describe TasksController, type: :controller do

  describe "GET /show" do
    it "should redirect to a show page for task" do
      task = Task.last
      get :show, {id: task.id, feature_id: task.feature.id, project_id: task.feature.project.id}
      expect(response).to be_successful
    end 
  end

  describe "POST /create" do
    it "should create a new task" do
      feature = Feature.last
      post :create, params: {task:{id: 1, feature_id: feature.id, project_id: feature.project.id, description: "task sample"}}
      expect(response).to have_http_status(:created)
    end
  end

  describe "PATCH /update" do
    task = Task.first
    patch :update, params: {task: { id: task.id, feature_id: task.feature.id, project_id: task.feature.project.id, description: "task sample updated", started: true, done: true, delivered: false}}
    expect(response).to have_http_status(:updated)
  end
end