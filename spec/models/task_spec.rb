require 'rails_helper'

RSpec.describe Task, type: :model do
  project = Project.first
  feature = Feature.first_or_create!(title: "feature1", description: "desc of feature1", category_id: 1, project: project)
  task = Task.new(description: "sample task", feature: feature)

  it "should have a description" do
    task.description = ""
    expect(task).to_not be_valid
  end

  it "task should belongs to a feature" do
    task.description = "sample task"
    task.feature = nil
    expect(task).to_not be_valid
  end

end
