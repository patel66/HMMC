require 'spec_helper'

module HMMC
  describe 'SignIn' do

    before do
      @user1 = HMMC.db.create_user(:name => "John", :email=> "John@mail.com", :password => "password")
    end

    it "Returns an error if the user is not found" do
      result = SignIn.run({ email: "nope@notfound.com", password: "password" })
     
      expect(result.success?).to eq(false)
      expect(result.error).to eq(:email_not_found)
    end

    it "Returns an error if the password is incorrect" do
      result = SignIn.run({ email: "John@mail.com", password: "NOTtherightpassword" })
      expect(result.success?).to eq(false)
      expect(result.error).to eq(:incorrect_password)
    end

    it "Creates a session and returns a session_id" do
      # HMMC.db.create_session(useruser.id)
      # binding.pry
      result = SignIn.run({ email: "John@mail.com", password: "password" })
      expect(result.success?).to eq(true)
      expect(result.session_id).to be_a(String)

      expect(result.session_id.length > 10).to eq(true)
    end
  end
end
