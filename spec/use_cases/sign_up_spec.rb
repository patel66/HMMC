
require "spec_helper"

# module HMMC
#   describe HMMC::SignUp do
#     xit "returns an error if the email is already taken" do
#       user1 = HMMC.db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
#       result = SignUp.run({ :name => "John", :email=> "John@mail.com", :password => "123" })
#       expect(result.success?).to eq(false)
#       expect(result.error).to eq(:email_taken)
#     end

#     xit "creates the user and signs them in" do
#       result = SignUp.run({ :name => "John", :email=> "John@mail.com", :password => "123" })
#       expect(result.success?).to eq(true)
#       expect(result.session_id).to be_a(Fixnum)
#     end


#   end
# end



describe HMMC::SignUp do
  let(:db){HMMC.db}

  before do
    # Seed with some schools
    db.clear_everything
  end

  it "throws an error if the name is empty" do

    result = described_class.run(:name=> "", :email=> "John@mail.com", :password=> "1234")
    expect(result.success?).to eq false
    expect(result.error).to eq :invalid_name
  end

  it "Can't sign up, if email is already in use" do

    result = described_class.run(:name=> "John", :email=> "John@mail.com", :password=> "1234")
    binding.pry
    expect(result.success?).to eq true

    result2 = described_class.run(:name=> "Phil", :email=> "John@mail.com", :password=> "1234")
    expect(result2.success?).to eq false
    expect(result2.error).to eq :email_already_in_use
    #expect(result.user.name).to eq "John"

  end
end
