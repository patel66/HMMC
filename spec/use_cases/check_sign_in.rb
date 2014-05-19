require 'spec_helper'


 describe HMMC::CheckSignIn do

  let(:db){HMMC.db}

  before do
    db.clear_everything
  end

  describe 'CheckSignIn' do
    xit "returns an error if the user is not found" do
      result = described_class.run({ email: "john@mail.com", password: "1234" })
      expect(result.success?).to eq(false)

      # result = described_class.run(:session_id => 95 )
      # expect(result.success?).to eq(false)
      # expect(result.error).to eq(:user_not_found)
    end

   xit "returns success if the user is signed in" do
      @user1 = HMMC.db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
      result = described_class.run(session.id)
      expect(result.success?).to eq(true)
    end
  end
end



