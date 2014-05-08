require "spec_helper"

describe HMMC::Activity do

  it "should be an Activity class" do
    activity = HMMC::Activity.new
    expect(activity.class).should == HMMC::Activity
  end
end
