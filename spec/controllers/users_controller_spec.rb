require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:valid_attributes) do
    {
      username: 'soumya',
      email: 'soumy@example.com',
      password: 'pAssword@123'
    }
  end
  let(:invalid_attributes) do
    {
      username: 'soumya',
      email: 'soumyexample.com',
      password: 'pssword@123'
    }
  end

  describe "#new" do
    it "should redirect to signup page" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "should create a new user" do
        post :create, params: {user: valid_attributes}
        expect(response).to be_successful
      end

      it "should redirect to projects path" do
        post :create, params: {user: valid_attributes}
        projects = User.last.projects
        redirect_to(projects_path)
        expect(response).to be_successful
      end
    end

    context "with invalid parameters" do
      it "should not create a new user" do
        post :create, params: {user: valid_attributes}
        expect(response).to_not be_successful
      end
    end
  end
end