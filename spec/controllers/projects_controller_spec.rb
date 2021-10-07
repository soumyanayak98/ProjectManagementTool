require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  curr_user = User.first_or_create!(username: "soumya", email:"soumya@example.com", password: "Pa@test01")

  describe 'GET /index' do
    it "should return all projects belongs to the current user" do
      projects = curr_user.projects
      get :index
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET /show" do
    it "should redirect to a show page for project" do
      project = Project.last
      get :show, :id => project.id
      expect(response).to be_successful
    end 
  end

  describe "POST /create" do
    it "should create project" do
      project = Project.new(user: curr_user, project_name: "new project")
      project.save
      expect(response).to be_successful
    end

    it "should redirect to the projects path" do
      projects = curr_user.projects
      redirect_to(projects_path)
      expect(response).to be_successful
    end
  end
end