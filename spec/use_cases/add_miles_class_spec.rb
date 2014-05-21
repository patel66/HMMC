require "spec_helper"


describe HMMC::AddMilesClass do
  let(:db) {HMMC.db}


  before do
    db.clear_everything
  end


  xit "can't add 100 miles to a classroom in one input" do
   user = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
   school = db.create_school(:name=> "Kempner HighSchool", :address=> {:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land"}, :user_id => user.id)

   history_class = db.create_classroom(:miles => 0, :name=>"History", :school_id=>school.id)
   # school.add_classroom(history_class)
   # history_class.add_miles(110)

   result = subject.run({:classroom=> history_class.id, :milesclass=> 101, :school_id => school.id })

   expect(result.success?).to eq false
  end

  xit "adds miles to class, also shows up in school" do
   user = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
   school = db.create_school(:name=> "Kempner HighSchool", :address=> {:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land"},:miles=> 100, :user_id => user.id)
   history_class = db.create_classroom(:miles => 0, :name=>"History", :school_id=>school.id)
   # math_class = db.create_classroom(:miles => 0, :name=>"math class", :school_id=>school.id)
   school.add_classroom(history_class)

   math_class = db.create_classroom(:miles => 0, :name=>"Math", :school_id=>school.id)
   school.add_classroom(math_class)

   result1 = subject.run(:classroom => history_class.id, :school => school, :milesclass => 65, :school_id => school.id)
  # subject.run(:classroom => "Math", :school => school, :milesclass => 50, :school_id => school.id)
   # subject.run(:classroom => math_class, :school => school, :milesclass => 30, :school_id => school.id)
   # expect(result.school.total_miles + result2.school.total_miles).to eq 75
   result2 = subject.run(:classroom => math_class.id, :school => school, :milesclass => 70, :school_id => school.id)
   # binding.pry
   expect(result2.success?).to eq true
   expect(result2.school.total_miles).to eq 135

  end

end
