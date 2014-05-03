require 'spec_helper'

describe HMMC::Databases::InMemory do
  let(:db) {HMMC.db}

  it "creates a user" do
    user = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
    expect(@users.length).to eq 1
    expect(user.name).to eq "John"
    expect(user.email).to eq "John@mail.com"
    expect(user.password).to eq "123"

    expect(user.school).to be_a HCCM::School
    #when you create a user, they have a name,email,password, and school they belong to
  end

  it "gets a user" do
    user = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
    retreived_user = db.get_user(:id => user.id)
    expect(retreived_user.name).to eq "John"

  end
# attr_accessor :id, :name, :address, :miles
 # starting_turn = Turn.new(:game_id => game.id, :player => starting_player)


  it "gets a school" do
    school = db.create_school(:name=> "Kempner HighSchool", :address=> {:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land"},:miles=> 0)
    retreived_school = db.get_school(:id=>school.id)
    expect(retreived_school.address[:city]).to eq "Texas"
  end
end
# attr_accessor :id, :name, :email, :password
# require 'spec_helper'

# describe RabbitDice::Databases::InMemory do
#   let(:db) { RabbitDice.db }

#   it "create a game" do
#     game = db.create_game :players => ['Alice', 'Bob', 'Carl']

#     expect(game.players).to include('Alice', 'Bob', 'Carl')
#     expect(game.winner).to be_nil
#     expect(game.dice_cup).to be_a RabbitDice::DiceCup

#     expect(game.turns.count).to eq 1
#     expect(game.turns.first.player).to match /^Alice|Bob|Carl$/
#     expect(game.turns.first.rolls.count).to eq 0
#   end

#   it "gets a game" do
#     created_game = db.create_game :players => ['Dan', 'Earl', 'Fred']
#     game = db.get_game(created_game.id)

#     # I'm repeating myself, but that's ok if it's one test. maybe
#     expect(game.players).to include('Dan', 'Earl', 'Fred')
#     expect(game.winner).to be_nil
#     expect(game.dice_cup).to be_a RabbitDice::DiceCup

#     expect(game.turns.count).to eq 1
#     expect(game.turns.first.player).to match /^Dan|Earl|Fred$/
#     expect(game.turns.first.rolls.count).to eq 0
#   end
# end
