require 'spec_helper.rb'

describe HMMC::ClassRoom do

  it "A classroom should be an instance of ClassRoom" do
    new_class_room = HMMC::ClassRoom.new
    expect(new_class_room.class).should == HMMC::ClassRoom
  end

  it "A classroom should initialize with zero miles" do
    new_class_room = HMMC::ClassRoom.new
    expect(new_class_room.miles).to eq 0
  end

  it "A user should be able to add miles to a classroom" do
    new_class_room = HMMC::ClassRoom.new
    expect(new_class_room.miles).to eq 0

    new_class_room.add_miles(50)
    expect(new_class_room.miles).to eq 50
  end


end
