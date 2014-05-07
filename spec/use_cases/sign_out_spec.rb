require 'spec_helper'

module HMMC
  describe 'Sign Out' do

    it "returns an error if the session_id is not found" do
      result = SignOut.run(session_key: 999)
      expect(result.success?).to eq false
      expect(result.error).to eq :session_not_found
    end

    it "signs the user out" do
      bob = HMMC.db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
      session = HMMC.db.create_session(user_id: bob.id)
      # binding.pry
      result = SignOut.run(session_key: session[:id])
      expect(result.success?).to eq(true)
      # binding.pry
      expect(HMMC.db.get_user_by_sid(session[:id])).to eq(nil)
    end
  end
end
