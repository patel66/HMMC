require 'spec_helper'

describe HMMC::CreateSchool do
  let(:db){HMMC.db}
  it "should throw an error if any of the parameters are empty" do
    user = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
    school = db.create_school(:name=> "",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land", :user_id => user.id)

    result = subject.run(:name => school.name, :street=> school.street, :state => school.state, :city => school.city, :school => school)
    expect(result.success?).to eq false

    school2 = db.create_school(:name=> "spring high school",:street=>"14777 Voss Rd",:state=>"",:city=>"Sugar Land", :user_id => user.id)
    result = subject.run(:name => school2.name, :street=> school2.street, :state => school2.state, :city => school2.city, :school => school)
    expect(result.success?).to eq false

  end

  it "should create a school, if all the parameters are available" do
    user = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
     school = db.create_school(:name=> "spring high school",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land", :user_id => user.id)
     result = subject.run(:name => school.name, :street=> school.street, :state => school.state, :city => school.city, :school => school)
     expect(result.success?).to eq true
     expect(result.school.name).to eq "spring high school"
  end
end


