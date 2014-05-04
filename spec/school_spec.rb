require 'spec_helper'

describe HMMC::School do
  let(:db) {HMMC.db}

  it "School is a school object" do
    highschool = HMMC::School.new
    expect(highschool.class).should == HMMC::School
  end

  it "School should initilize with empty array of classes" do
    highschool = HMMC::School.new
    expect(highschool.classrooms.class).should == Array
  end

  it "Should be able to add classes to a school" do
    highschool = HMMC::School.new
    history_class = db.create_classroom(:school_id => highschool.id, :miles=> 0, :name=> "History")
    highschool.add_classroom(history_class)
    expect(highschool.classrooms.length).to eq 1
    expect(highschool.classrooms[0].name).to eq "History"

    math_class = db.create_classroom(:school_id => highschool.id, :miles=> 0, :name=> "Math")
    highschool.add_classroom(math_class)
    expect(highschool.classrooms.length).to eq 2
    expect(highschool.classrooms[1].name).to eq "Math"
  end

  it "School should initialize with zero miles" do
    highschool = HMMC::School.new
    expect(highschool.total_miles).to eq 0
  end

  it "User should be able to add to the total miles of a school" do
    highschool = HMMC::School.new
    expect(highschool.total_miles).to eq 0
    highschool.add_miles(100)
    expect(highschool.total_miles).to eq 100
  end

  it "Total miles of a school should add up the miles inputed from classrooms, also the miles directly added to the school " do
    user = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
    school = db.create_school(:name=> "Kempner HighSchool", :address=> {:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land"},:miles=> 0, :user_id => user.id)
    history_class = db.create_classroom(:school_id => school.id, :miles=> 0, :name=> "History")


    expect(school.total_miles).to eq 0
    expect(school.classrooms.length).to eq 0

    school.add_classroom(history_class)
    expect(school.classrooms.length).to eq 1

    school.add_miles(100)
    expect(school.total_miles).to eq 100

    expect(history_class.miles).to eq 0
    history_class.add_miles(25)
    expect(history_class.miles).to eq 25
    expect(school.total_miles).to eq 100

    school.add_total_miles
    expect(school.total_miles).to eq 125

    math_class = db.create_classroom(:school_id => school.id, :miles=> 0, :name=> "Math class")
    expect(school.classrooms.length).to eq 1
    school.add_classroom(math_class)
    expect(school.classrooms.length).to eq 2

    expect(school.classrooms[1].name).to eq "Math class"

    expect(school.classrooms[1].miles).to eq 0
    math_class.add_miles(50)
    expect(school.classrooms[1].miles).to eq 50
    expect(school.total_miles).to eq 125

    school.add_total_miles
    #expect(school.total_miles).to eq 175
  end
end
