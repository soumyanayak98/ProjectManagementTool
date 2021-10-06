require 'rails_helper'

RSpec.describe Project, type: :model do

  curr_user = User.first_or_create!(username: "soumya", email:"soumya@example.com", password: "Pa@test01")
  
  project = Project.new(project_name: "", user: curr_user)

  it "project_name should be present" do
    expect(project).to_not be_valid
    project.project_name = "first project"
    expect(project).to be_valid
  end

  it "project_name should atleast 5 characters long" do
    project.project_name = "abc"
    expect(project).to_not be_valid
  end

  it "project_name should atmax 100 characters long" do
    project.project_name = "a" * 101
    expect(project).to_not be_valid
  end

  it "should capitalize project_name" do
    project.project_name = "first project"
    project.save!
    expect(project.project_name).to eq "First project"
  end

end
