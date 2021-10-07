require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new(username: "soumya", email:"soumya@example.com", password: "Pa@test01")

  it "should contain a username" do
    user.username = ""
    expect(user).to_not be_valid
  end

  it "should contain a email" do
    user.username = "soumya"
    user.email = ""
    expect(user).to_not be_valid
  end

  it "length of email should be less than 150" do
    user.email = "soumya@example.com"
    expect(user.email).to have_attributes(size: (be < 150))
  end

  it "should downcase email" do
    user.email = "SOumYa@exaMple.com"
    user.save
    expect(user.email).to eq "soumya@example.com"
  end

  it "should contain a password" do
    user.password = nil
    expect(user).to_not be_valid
  end

  it "password should be within 8 to 40 char long" do
    user.password = "Abc@1"
    expect(user.password).to_not have_attributes(size: (be > 8)) 
    user.password = "Abc@2" * 10
    expect(user.password).to_not have_attributes(size: (be < 40))
  end

  it "email should be valid " do
    user.password = "Pa@test01"
    expect(user.email).to match(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)
  end

  it "password should be valid" do
    expect(user.password).to match(/\A(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]])/x)
  end

  it "should have may projects" do
    expect(user.projects).to_not be_nil
  end
  it "should have may tasks" do
    expect(user.tasks).to_not be_nil
  end
end
