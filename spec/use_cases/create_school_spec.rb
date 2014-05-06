require 'spec_helper'

describe HMMC::CreateSchool do
  let(:db){HMMC.db}
  it "should throw an error if any of the parameters are empty" do
    user = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
    school = db.create_school(:name=> "spring high school",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land", :user_id => user.id)

    result = subject.run(:school_name => school.name, :street=> school.street, :state => school.state, :city => school.city, :school => school)
    expect(result.success?).to eq true
  end
end
