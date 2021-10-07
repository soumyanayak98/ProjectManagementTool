require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  task = Task.first
  curr_user = User.first
  describe "POST /create" do
    it "should create a comment" do
      post :create, params: {comment: {
        id: 1, body:"sample comment", name: curr_user.username, task_id: task.id, feature_id: task.feature.id, project_id: task.feature.project.id
        }}
      expect(response.status).to eq :created
    end
  end
end