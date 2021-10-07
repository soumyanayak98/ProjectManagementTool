require 'rails_helper'

RSpec.describe MentionsController, type: :controller do

  describe 'GET /index' do
    it 'should return json' do
      task = Task.first
      @users = task.users.to_json
      get :index, format: 'json'
      expect(response.body).to eq @users.to_json
    end
  end
end