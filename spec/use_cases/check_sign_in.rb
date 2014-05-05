require 'spec_helper'

module HMMC
  describe 'CheckSignIn' do
    it "returns an error if the user is not signed in" do
      result = CheckSignIn.run(95)
      expect(result.success?).to eq(false)
      expect(result.error).to eq(:not_signed_in)
    end

    it "returns success if the user is signed in" do
      @user1 = HMMC.db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
      session = HMMC.db.create_session(@user1.id)
      result = CheckSignIn.run(session.id)
      expect(result.success?).to eq(true)
    end
  end
end