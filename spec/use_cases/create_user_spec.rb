require "spec_helper"

describe HMMC::CreateUser do
  let(:db) {HMMC.db}
  before do
    db.clear_everything

  end

  context "error" do
    it "Checks USER errors" do

      result = described_class.run(:name => "Philip", :email => "this@that.com", :password => "mL7", school_id: "")

      expect(result.success?).to eq(false)
      expect(result.error).to eq(:invalid_password)

    end
  end

  context "success" do
    it "Successfully creates a user" do
      result = described_class.run(:name => "Philip", :email => "this@that.com", :password => "makerL7", school_id: 1)
      expect(result.success?).to eq(true)
      expect(result.user.name).to eq('Philip')
    end
  end
end
