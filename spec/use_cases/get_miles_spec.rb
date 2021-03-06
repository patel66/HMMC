require "spec_helper"

describe HMMC::GetSchoolMiles do
  let(:db) {HMMC.db}

  before do
    db.clear_everything
    @school = db.create_school(:name=> "Kempner HighSchool",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land")
    @classroom = db.create_classroom(:school_id => @school.id, :miles=> 10, :name=> "History")
    # TO DO should put this in db instead
    @school.add_classroom(@classroom)
  end

  context "error" do
    xit "ensures school id is valid" do
      result = subject.run(school_id: 9999)
      expect(result.success?).to eq(false)
      expect(result.error).to eq(:school_doesnt_exist)

    end
  end

  context "success" do
    xit "ensures it returns miles and school" do
      result = subject.run(:school_id => @school.id)
      expect(@school.classrooms.length).to eq 1
      expect(result.success?).to eq(true)
      expect(result.miles).to eq(10)

      expect(result.school.name).to eq("Kempner HighSchool")
    end
  end
end
