
  shared_examples 'a database' do

    let(:db) { described_class.new }
    before { db.clear_everything }

    it "creates a user" do
      user = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
      expect(user.name).to eq "John"
      expect(user.email).to eq "John@mail.com"
      expect(user.password).to eq "123"

    end

    it "create_school" do
      user = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
      school = db.create_school(:name=> "Kempner HighSchool",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land")
      expect(school.city).to eq "Sugar Land"
      expect(school.name).to eq "Kempner HighSchool"
    end

    it "gets a user" do
      user = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
      retreived_user = db.get_user(user.id)
      expect(retreived_user.name).to eq "John"

    end


    it "gets a school" do
      school = db.create_school(:name=> "Kempner HighSchool",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land")
      retreived_school = db.get_school(school.id)
      expect(retreived_school.name).to eq "Kempner HighSchool"
    end

    it "creates a classroom" do
      school = db.create_school(:name=> "Kempner HighSchool",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land")
      classroom = db.create_classroom(:school_id => school.id, :miles=> 0, :name=> "History")
      expect(classroom.miles).to eq 0
      expect(classroom.name).to eq "History"
      expect(classroom.school_id).to eq school.id

    end

    it "gets a classroom" do
      school = db.create_school(:name=> "Kempner HighSchool",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land")

      classroom = db.create_classroom(:school_id => school.id, :name=> "History")

      retreived_classroom = db.get_classroom(classroom.id)

      expect(retreived_classroom.name).to eq "History"
      expect(retreived_classroom.school_id).to eq school.id

    end

    xit "creates a student ranking" do
      school = db.create_school(:name=> "Kempner HighSchool", :address=> {:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land"})
      student_rank = db.create_ranking(:school_id => school.id, :students => {:Joe=> 0, :Jessica=> 20, :Bob=>25})
      expect(student_rank.school_id).to eq school.id
      expect(student_rank.students.class).should == Hash
    end

    xit "gets a student ranking " do
       school = db.create_school(:name=> "Kempner HighSchool", :address=> {:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land"})
       student_rank = db.create_ranking(:school_id => school.id, :students => {:Joe=> 0, :Jessica=> 20, :Bob=>25})
       retreived_rank = db.get_rank(student_rank.id)
       expect(retreived_rank.school_id).to eq school.id
       expect(retreived_rank.students[:Jessica]).to eq 20
    end

    it "gets the school from the user" do
      user = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
      school = db.create_school(:name=> "Kempner HighSchool",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land", :user_id => user.id)
      retreived_school = db.get_school(school.id)
      expect(retreived_school.user_id).to eq user.id

    end

    it "updates a classroom miles" do
      user = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
      school = db.create_school(:name=> "Kempner HighSchool",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land", :user_id => user.id)
      classroom = db.create_classroom({:school_id => school.id, :miles => 0, :name=> "History"})


      school.add_classroom(classroom)

      expect(classroom.miles).to eq 0

      updated_classroom = db.update_classroom_miles({:classroom_id => classroom.id, :miles => 20})

      expect(updated_classroom.miles).to eq 20
    end

    it "updates a school to have classrooms" do
      user = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
      school = db.create_school(:name=> "Kempner HighSchool",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land", :user_id => user.id)
      classroom = db.create_classroom({:school_id => school.id, :miles => 0, :name=> "History"})

    end

    it "gets classroom by name" do
      user = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
      school = db.create_school(:name=> "Kempner HighSchool",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land", :user_id => user.id)
      classroom1 = db.create_classroom({:school_id => school.id, :miles => 0, :name=> "Math"})
      classroom2 = db.create_classroom({:school_id => school.id, :miles => 0, :name=> "English"})
      classroom3 = db.create_classroom({:school_id => school.id, :miles => 0, :name=> "History"})

       retreived_classroom = db.get_class_by_name("History")
       expect(retreived_classroom.name).to eq "History"

    end

end
