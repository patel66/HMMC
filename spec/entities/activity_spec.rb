require "spec_helper"

describe HMMC::Activity do

  let(:db) {HMMC.db}
  let(:user) {db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")}
  let(:school) {school = db.create_school(:name=> "Kempner HighSchool",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land", :user_id => user.id, :students => 200 )}

  it "should be an Activity class" do
    activity = HMMC::Activity.new
    expect(activity.class).should == HMMC::Activity
  end

  it "should be able to add miles to an activty" do
    activity = HMMC::Activity.new(:miles => 10)
    expect(activity.miles).to eq 10
  end

  it "should be able to add students to an activty" do
    activity = HMMC::Activity.new(:miles=> 10, :students => 20 )
    expect(activity.students).to eq 20
    expect(activity.miles).to eq 10
  end

  it "should be able to add a date to an activity" do
    date = Time.parse("May 8 2014")
    activity = HMMC::Activity.new(:miles=> 10, :students => 20, :date => date, :school_id => school.id )
    expect(activity.date.class).should == Time
    expect(activity.date).to eq "May 8 2014"
  end

  it "should be able to get a school, from an activity" do
    date = Time.parse("May 8 2014")
    activity = HMMC::Activity.new(:miles=> 10, :students => 20, :date => date, :school_id => school.id )
    school_id = activity.school_id
    retreived_school = db.get_school(school_id)
    expect(retreived_school.class).should == HMMC::School
    expect(retreived_school.name).to eq "Kempner HighSchool"
  end
end
