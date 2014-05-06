require 'spec_helper'

describe HMMC::Setgoal do
  let(:db){HMMC.db}

  it "it can set a goal" do
   user = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
   school = db.create_school(:name=> "Kempner HighSchool", :address=> {:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land"},:miles=> 0, :user_id => user.id)
   result = subject.run(:goal => 5000, :school_id => school.id)
   expect(result.success?).to eq true
   expect(result.school.goal).to eq 5000
  end
end
