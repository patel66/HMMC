require "spec_helper"


describe HMMC::AddMilesClass do
  let(:db) {HMMC.db}

  xit "can't create a classroom without a school" do
    history_class = db.create_classroom(:miles => 0, :name=>"History class", :school_id=>99999)
    result.subject.run({:name=> history_class.name,:school_id => history_class.school_id,:id=> history_class.id })
    expect(result.error?).to eq true
  end

end
