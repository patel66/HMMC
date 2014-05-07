require 'spec_helper'


 describe HMMC::CheckSignIn do

  let(:db){HMMC.db}

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


# require_relative '../spec_helper.rb'

# describe RPS::SignIn do
#   it 'exists' do
#     expect(RPS::SignIn).to be_a(Class)
#   end

#   context "success" do
#     it 'creates a session for the player' do
#       username = "Jack"
#       pw = "123"
#       player = RPS.db.create_player(username, pw)
#       result = RPS::SignIn.run({ username: username, password: pw })

#       expect(result.success?).to eq(true)
#       expect(result.session.user_id).to eq(player.id)
#       expect(result.session_key).to eq(result.session.id)
#     end
#   end

#   context "failure" do
#     it "errors if name does not exist" do
#       username = "Jack"
#       pw = "123"
#       result = RPS::SignIn.run({ username: username, password: pw })

#       expect(result.error?).to eq(true)
#       expect(result.error).to eq(:player_nonexistent)
#     end

#     it "errors if password is incorrect" do
#       username = "Jack"
#       pw = "123"
#       wrong_pw = "245"
#       player = RPS.db.create_player(username, pw)
#       result = RPS::SignIn.run({ username: username, password: wrong_pw })

#       expect(result.error?).to eq(true)
#       expect(result.error).to eq(:incorrect_password)
#     end
#   end
# end
