require 'spec_helper'

module HMMC
  describe 'Sign Out' do

    it "returns an error if the session_id is not found" do
      result = SignOut.run(999)
      expect(result[:session_not_found])
    end
  
    it "signs the user out" do
      bob = HMMC.db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
      session = HMMC.db.create_session(bob.id)
      result = SignOut.run(session.id)
      expect(HMMC.db.get_user_by_sid(session.id)).to eq(nil)
    end
  end
end
