require 'spec_helper'

describe HMMC::CreateClassRoom do
  let(:db) { HMMC.db }

  it "should throw an error if a classroom is created without a school " do
    user = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
    school = db.create_school(:name=> "Kempner HighSchool",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land", :user_id => user.id)
    classroom = db.create_classroom({:school_id => 999, :miles => 0, :name=> "History"})
    result = subject.run(:school_id=> classroom.school_id, :classroom => classroom)

    expect(result.success?).to eq false
  end

  it "should throw an error if a classroom is created with a name" do
    user = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
    school = db.create_school(:name=> "Kempner HighSchool",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land", :user_id => user.id)
    classroom = db.create_classroom({:school_id => school.id, :miles => 0, :name=> ""})

    result = subject.run(:school_id => school.id, :miles => 0, :name=> "")
    expect(result.success?).to eq false
  end


end

# school = db.create_school(:name=> "Kempner HighSchool",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land", :user_id => user.id)
