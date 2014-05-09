
  shared_examples 'a database' do

    let(:db) { described_class.new }
    before { db.clear_everything }

    it "creates a user" do
      user = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
      expect(user.name).to eq "John"
      expect(user.email).to eq "John@mail.com"
      expect(user.password).to eq "123"

    end

    it "creates an activity" do
      activity = db.create_activity(:miles => 10, :students => 20, :date => Time.parse("May 8 2014"))
      expect(activity.id).to eq activity.id
      expect(activity.miles).to eq 10
      expect(activity.students).to eq 20
      expect(activity.date).to eq "May 8 2014"
    end

    it "gets an activity" do

      activity = db.create_activity(:miles => 10, :students => 20, :date => Time.parse("May 8 2014"))
      retreived_activity = db.get_activity(activity.id)
      expect(retreived_activity.miles).to eq 10
      expect(retreived_activity.students).to eq 20
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

    it "updates a classroom" do
      user = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
      school = db.create_school(:name=> "Kempner HighSchool",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land", :user_id => user.id)
      classroom = db.create_classroom({:school_id => school.id, :miles => 0, :name=> "History"})


      school.add_classroom(classroom)

      expect(classroom.miles).to eq 0

      updated_classroom = db.update_classroom({:classroom_id => classroom.id, :miles => 20})

      expect(updated_classroom.miles).to eq 20 #0
    end

    it "updates a school" do
      user = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
      school = db.create_school(:name=> "Kempner HighSchool",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land", :user_id => user.id, :students => 200 )
      activity1 = db.create_activity(:miles => 10, :students => 20, :date => Time.parse("May 8 2014"))
      school.add_activity(activity1)

      activity2 = db.create_activity(:miles => 50, :students => 20, :date => Time.parse("May 8 2014"))
      activity3 = db.create_activity(:miles => 60, :students => 20, :date => Time.parse("May 8 2014"))

      school.add_activity(activity2)
      school.add_activity(activity3)
      expect(school.total_miles_school).to eq 120
      expect(school.activitys.size).to eq 3

      expect(school.students).to eq 200
      updated_school = db.update_school({:id => school.id, :students => 200})
      expect(updated_school.students).to eq 200

    end

    it "updates an activity" do
      user = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
      school = db.create_school(:name=> "Kempner HighSchool",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land", :user_id => user.id)
      activity = db.create_activity(:miles => 10, :students => 20, :date => Time.parse("May 8 2014"))
      school.add_activity(activity)
      expect(school.total_miles_school).to eq 10

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
      school.add_classroom(classroom1)
      classroom2 = db.create_classroom({:school_id => school.id, :miles => 0, :name=> "English"})
      school.add_classroom(classroom2)
      classroom3 = db.create_classroom({:school_id => school.id, :miles => 0, :name=> "History"})
      school.add_classroom(classroom3 )
      retreived_classroom = db.get_class_by_name("History")
      expect(retreived_classroom.name).to eq "History"
      expect(school.classrooms.size).to eq(3)
    end

    it "gets user by email" do
      user1 = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
      user2 = db.create_user(:name => "Saray", :email=> "Sarah@mail.com", :password => "1234")

      retreived_user = db.get_user_by_email(user1.email)
      expect(retreived_user.name).to eq "John"
    end


end
