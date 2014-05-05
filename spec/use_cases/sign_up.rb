require 'spec_helper'

module HMMC
  describe 'Sign Up' do
    it "returns an error if the email is already taken" do
      user1 = HMMC.db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
      result = SignUp.run({ :name => "John", :email=> "John@mail.com", :password => "123" })
      expect(result.success?).to eq(false)
      expect(result.error).to eq(:email_taken)
    end

    it "creates the user and signs them in" do
      result = SignUp.run({ :name => "John", :email=> "John@mail.com", :password => "123" })
      expect(result.success?).to eq(true)
      expect(result.session_id).to be_a(Fixnum)
    end


  end
end
