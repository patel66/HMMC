require "spec_helper"


describe HMMC::AddMilesClass do
  let(:db) {HMMC.db}

  it "can't create a classroom without a school" do
    history_class = db.create_classroom(:miles => 0, :name=>"History class", :school_id=>99999)
    result.subject.run({:name=> history_class.name,:school_id => history_class.school_id,:id=> history_class.id })
    expect(result.error?).to eq true
  end

end
# :id, :school_id, :miles, :name

# describe Timeline::CreateEvent do
#   before do
#     @db = Timeline.db
#   end

#   it "I want to create an Event that is associated with a team" do
#     team1 = @db.create_team :name => 'Sungod'
#     user1 = @db.create_user(:user=> "Bob")
#     event = @db.create_event(:team_id => team1.id)
#     expect(event.team_id).to eq(team1.id)
#     result = subject.run({:name =>team1.name, :team_id=>team1.id, :user_id =>user1.id})
#     expect(result.success?).to eq true
#     expect(result.event.team_id).to eq (team1.id)
#     @db.clear_everything
#   end


