require "spec_helper"

describe HMMC::SignUp do
  let(:db){HMMC.db}

  before do
    # Seed with some schools
    db.clear_everything
  end

  it "throws an error if the user name is empty" do

    result = described_class.run(:name=> "", :email=> "John@mail.com", :password=> "1234")
    expect(result.success?).to eq false
    expect(result.error).to eq :invalid_name
  end

  it "Can't sign up, if email is already in use" do

    result = described_class.run(:name=> "John",:email=> "John@mail.com",:password=> "1234", :school_name => "Kempner High School", :state => "Texas", :city => "Sugar Land", :street =>"14777 Voss Rd", :students => 500)
#
    expect(result.success?).to eq true

    result2 = described_class.run(:name=> "Phil", :email=> "John@mail.com", :password=> "1234")
    expect(result2.success?).to eq false
    expect(result2.error).to eq :email_already_in_use
    #expect(result.user.name).to eq "John"

  end

  it "throws an error if the password is empty" do
    result = described_class.run(:name=> "John", :email=> "John@mail.com", :password=> "")
    expect(result.success?).to eq false
    expect(result.error).to eq :invalid_password
  end

  it "throws an error if any of the school parameters are empty" do
     result = described_class.run(:name=> "John",:email=> "John@mail.com",:password=> "1234", :school_name => "", :state => "Texas", :city => "Sugar Land", :street =>"14777 Voss Rd", :students => 500)
     expect(result.success?).to eq false
  end
end
 # school_name = inputs[:school_name]
 #      school_street = inputs[:street]
 #      school_state = inputs[:state]
 #      school_city = inputs[:city]
 #      school = inputs[:school]
