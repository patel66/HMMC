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
end
