require 'spec_helper'

describe HMMC::Databases::InMemory do
  let(:db) {HMMC.db}
  before {db.clear_everything}

  it "creates a user" do
    user = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
    #  expect(users.size).to eq 1
    # # expect(@users)
    expect(user.name).to eq "John"
    expect(user.email).to eq "John@mail.com"
    expect(user.password).to eq "123"

  end

  it "create_school" do
    user = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
    school = db.create_school(:name=> "Kempner HighSchool", :address=> {:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land"},:miles=> 0, :user_id => user.id)
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

  it "creates a classroom" do
     school = db.create_school(:schoolname=> "Kempner HighSchool", :address=> {:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land"},:miles=> 0)
    classroom = db.create_classroom(:school_id => school.id, :miles=> 0, :name=> "History")
    expect(classroom.miles).to eq 0
    expect(classroom.name).to eq "History"
    expect(classroom.school_id).to eq school.id

  end

  it "gets a classroom" do
    school = db.create_school(:schoolname=> "Kempner HighSchool", :address=> {:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land"},:miles=> 0)

    classroom = db.create_classroom(:school_id => school.id, :miles=> 0, :name=> "History")

    retreived_classroom = db.get_classroom(classroom.id)

    expect(retreived_classroom.name).to eq "History"
    expect(retreived_classroom.school_id).to eq school.id

  end

  it "creates a student ranking" do
    school = db.create_school(:schoolname=> "Kempner HighSchool", :address=> {:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land"},:miles=> 0)
    student_rank = db.create_ranking(:school_id => school.id, :students => {:Joe=> 0, :Jessica=> 20, :Bob=>25})
    expect(student_rank.school_id).to eq school.id
    expect(student_rank.students.class).should == Hash
  end

  it "gets a student ranking " do
     school = db.create_school(:schoolname=> "Kempner HighSchool", :address=> {:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land"},:miles=> 0)
     student_rank = db.create_ranking(:school_id => school.id, :students => {:Joe=> 0, :Jessica=> 20, :Bob=>25})
     retreived_rank = db.get_rank(student_rank.id)
     expect(retreived_rank.school_id).to eq school.id
     expect(retreived_rank.students[:Jessica]).to eq 20
  end

  it "gets the school from the user" do
    user = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
    school = db.create_school(:name=> "Kempner HighSchool", :address=> {:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land"},:miles=> 0, :user_id => user.id)
    retreived_school = db.get_school(school.id)
    expect(retreived_school.user_id).to eq user.id

  end
end

