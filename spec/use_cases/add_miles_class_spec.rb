require "spec_helper"


describe HMMC::AddMilesClass do
  let(:db) {HMMC.db}



  it "can't add 100 miles to a classroom in one input" do
   user = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
   school = db.create_school(:name=> "Kempner HighSchool", :address=> {:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land"},:miles=> 0, :user_id => user.id)
   history_class = db.create_classroom(:miles => 0, :name=>"History class", :school_id=>school.id)
   # school.add_classroom(history_class)
   # history_class.add_miles(110)

   result = subject.run({:classroom=> history_class, :milesclass=> 101, :school_id => school.id })
   # binding.pry
   expect(result.success?).to eq false
  end

  xit "adds miles to class, also shows up in school" do
   user = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
   school = db.create_school(:name=> "Kempner HighSchool", :address=> {:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land"},:miles=> 0, :user_id => user.id)

   history_class = db.create_classroom(:miles => 0, :name=>"History class", :school_id=>school.id)
   math_class = db.create_classroom(:miles => 0, :name=>"math class", :school_id=>school.id)
   # binding.pry
   result = subject.run(:classroom => history_class, :school => school, :milesclass => 45, :school_id => school.id)
   result2 = subject.run(:classroom => math_class, :school => school, :milesclass => 30, :school_id => school.id)
   # expect(result.school.total_miles + result2.school.total_miles).to eq 75
   # expect(result.success?).to eq true
   # expect(result.school.total_miles).to eq 30

  end

end
