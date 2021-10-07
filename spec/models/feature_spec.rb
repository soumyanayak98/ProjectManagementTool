require 'rails_helper'

RSpec.describe Feature, type: :model do
  curr_user = User.first
  project = Project.first_or_create!(project_name: "first project", user: curr_user)
  feature = Feature.new(title: "feature1", description: "desc of feature1", project: project, category_id: 1)

  it "title should be present" do
    feature.title = ""
    expect(feature).to_not be_valid
  end

  it "description should be present" do
    feature.title = "feature1"
    feature.description = ""
    expect(feature).to_not be_valid
  end

  it "category_id should be present" do
    feature.description = "desc of feature1"
    feature.category_id = nil
    expect(feature).to_not be_valid
  end

  it "category_id should be integer" do
    feature.category_id = 1
    expect(feature.category_id).to be_a(Integer)
  end

  it "should create ticket_id for the feature" do
    feature.save
    expect(feature.ticket_id).to_not be_nil
  end

  it "feature should have many tasks" do
    expect(feature.tasks).to_not be_nil
  end

  it "feature should belongs to a project" do
    feature.project = nil
    expect(feature).to_not be_valid
  end
end
