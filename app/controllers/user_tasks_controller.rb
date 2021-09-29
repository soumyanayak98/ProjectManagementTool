class UserTasksController < ApplicationController
  def index
    @tasks = curr_user.tasks
  end
end