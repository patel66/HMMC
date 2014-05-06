require "spec_helper"

describe HMMC::CreateUser do
  let(:db) {HMMC.db}
  before do
    db.clear_everything
  end

  context "error" do
    it "ensures school id is valid" do

      result = described_class.run(:name => "Philip", :email => "this@that.com", :password => "makerL7", school_id: "")

      expect(result.success?).to eq(false)
      expect(result.error).to eq(:school_doesnt_exist)

    end
  end

  context "success" do
    it "ensures it returns miles and school" do
      result = described_class.run(school_id: 1)
      expect(result.success?).to eq(true)
      expect(result.miles).to eq(10)

      expect(result.school.name).to eq("Kempner HighSchool")
    end
  end
end
