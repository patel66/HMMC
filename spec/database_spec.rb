require 'spec_helper'

describe HMMC::Databases::InMemory do
  let(:db) {HMMC.db}

  it "creates a user" do
    user = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
    #  expect(users.size).to eq 1
    # # expect(@users)
    expect(user.name).to eq "John"
    expect(user.email).to eq "John@mail.com"
    expect(user.password).to eq "123"

  end

  it "create_school" do
    school = db.create_school(:name=> "Kempner HighSchool", :address=> {:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land"},:miles=> 0)
    expect(school.name).to eq "Kempner HighSchool"
    expect(school.address[:city]).to eq "Sugar Land"
  end

  it "gets a user" do
    user = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
    retreived_user = db.get_user(user.id)
    expect(retreived_user.name).to eq "John"

  end


  it "gets a school" do
    school = db.create_school(:schoolname=> "Kempner HighSchool", :address=> {:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land"},:miles=> 0)
    retreived_school = db.get_school(school.id)
    expect(retreived_school.address[:city]).to eq "Sugar Land"
  end
end

