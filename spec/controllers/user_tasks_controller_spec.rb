require 'rails_helper'
RSpec.describe UserTasksController, type: :controller do

  curr_user = User.first_or_create!(username: "soumya", email:"soumya@example.com", password: "Pa@test01")
  
  describe 'GET /index' do
    it "redirects to the user's tasks page" do
      tasks = curr_user.tasks
      redirect_to(user_tasks_path)
      expect(response).to be_successful
    end
  end
end