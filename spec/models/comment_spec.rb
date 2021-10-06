require 'rails_helper'

RSpec.describe Comment, type: :model do
  feature = Feature.first
  task = Task.first_or_create!(description: "sample task", feature: feature)
  comment = Comment.new(task: task, name: "soumya", body: "sample comment")

  it "should have a name" do
    comment.name = ""
    expect(comment).to_not be_valid
  end

  it "should have a body" do
    comment.name = "soumya"
    comment.body = ""
    expect(comment).to_not be_valid
  end

  it "comment must belongs to a task" do
    comment.body = "sample comment"
    comment.task = nil
    expect(comment).to_not be_valid
  end
end
