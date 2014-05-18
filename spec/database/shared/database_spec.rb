
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

    it "creates a sesssion key for a user" do

      user1 = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
      session = db.create_session(:user_id => user1.id)
      expect(session[:session_key].length).should > 15
    end

    it "gets a school from a user id" do
      user = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
      school = db.create_school(:name=> "Kempner HighSchool",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land", :user_id => user.id)

      retrevied_school = db.get_school_from_user_id(user.id)

      expect(retrevied_school.name).to eq "Kempner HighSchool"

    end

    it "gets all schools " do
      user = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
      school1 = db.create_school(:name=> "Kempner",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land", :user_id => user.id)
      school2 = db.create_school(:name=> "Dulles",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land", :user_id => user.id)
      school3 = db.create_school(:name=> "Fort Minor",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land", :user_id => user.id)
      school4 = db.create_school(:name=> "Cypress",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land", :user_id => user.id)

      activity = db.create_activity(:miles => 100, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school1.id)
      activity2 = db.create_activity(:miles => 100, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school1.id)
      activity3 = db.create_activity(:miles => 100, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school1.id)
      activity4 = db.create_activity(:miles => 1000, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school4.id)
      activity5 = db.create_activity(:miles => 100000, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school1.id)
      activity6 = db.create_activity(:miles => 100, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school2.id)
      activity7 = db.create_activity(:miles => 1000, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school3.id)

      school1.add_activity(activity)
      school1.add_activity(activity2)
      school1.add_activity(activity3)
      school4.add_activity(activity4)
      school1.add_activity(activity5)
      school2.add_activity(activity6)
      school1.add_activity(activity7)
      expect(school1.activitys.length).to eq 5
      # expect(school1.total_miles_school).to eq 50
      schools = db.get_all_schools
      expect(schools.map { |school| school.name}).to include('Kempner', 'Dulles', 'Fort Minor', "Cypress")
    end

    it 'can rank all schools' do
      user = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
      school1 = db.create_school(:name=> "Kempner",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land", :user_id => user.id, :students => 1500)
      school2 = db.create_school(:name=> "Dulles",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land", :user_id => user.id, :students => 5000)
      school3 = db.create_school(:name=> "Fort Minor",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land", :user_id => user.id, :students =>800)
      school4 = db.create_school(:name=> "Cypress",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land", :user_id => user.id, :students => 2300)

      activity = db.create_activity(:miles => 100, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school1.id)
      activity2 = db.create_activity(:miles => 100, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school1.id)
      activity3 = db.create_activity(:miles => 100, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school1.id)
      activity4 = db.create_activity(:miles => 1000, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school4.id)
      activity5 = db.create_activity(:miles => 100000, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school1.id)
      activity6 = db.create_activity(:miles => 100, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school2.id)
      activity7 = db.create_activity(:miles => 1000, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school3.id)

      school1.add_activity(activity)
      school1.add_activity(activity2)
      school1.add_activity(activity3)
      school4.add_activity(activity4)
      school1.add_activity(activity5)
      school2.add_activity(activity6)

      schools = db.get_all_schools

      expect(db.get_national_ranking[0].total_miles_school).to eq(school1.total_miles_school)
    end

    it "can rank by state" do
      user = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
      school1 = db.create_school(:name=> "Kempner",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land", :user_id => user.id)
      school2 = db.create_school(:name=> "Dulles",:street=>"14777 Voss Rd",:state=>"California",:city=>"Sugar Land", :user_id => user.id)
      school3 = db.create_school(:name=> "Fort Minor",:street=>"14777 Voss Rd",:state=>"Ohio",:city=>"Sugar Land", :user_id => user.id)
      school4 = db.create_school(:name=> "Cypress",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land", :user_id => user.id)

      activity = db.create_activity(:miles => 100, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school1.id)
      activity2 = db.create_activity(:miles => 100, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school1.id)
      activity3 = db.create_activity(:miles => 100, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school1.id)
      activity4 = db.create_activity(:miles => 1000, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school4.id)
      activity5 = db.create_activity(:miles => 100000, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school1.id)
      activity6 = db.create_activity(:miles => 100, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school2.id)
      activity7 = db.create_activity(:miles => 1000, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school3.id)

      school1.add_activity(activity)
      school1.add_activity(activity2)
      school1.add_activity(activity3)
      school4.add_activity(activity4)
      school1.add_activity(activity5)
      school2.add_activity(activity6)
      expect(db.get_state_ranking("Texas").size).to eq(2)
      expect(db.get_state_ranking("Texas")[0].total_miles_school).to eq(school1.total_miles_school)

    end

    it "can rank by city" do

      user = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
      school1 = db.create_school(:name=> "Kempner",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Houston", :user_id => user.id)
      school2 = db.create_school(:name=> "Dulles",:street=>"14777 Voss Rd",:state=>"California",:city=>"Sugar", :user_id => user.id)
      school3 = db.create_school(:name=> "Fort Minor",:street=>"14777 Voss Rd",:state=>"Ohio",:city=>"Austin", :user_id => user.id)
      school4 = db.create_school(:name=> "Cypress",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Houston", :user_id => user.id)

      activity = db.create_activity(:miles => 100, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school1.id)
      activity2 = db.create_activity(:miles => 100, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school1.id)
      activity3 = db.create_activity(:miles => 100, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school1.id)
      activity4 = db.create_activity(:miles => 1000, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school4.id)
      activity5 = db.create_activity(:miles => 100000, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school1.id)
      activity6 = db.create_activity(:miles => 100, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school2.id)
      activity7 = db.create_activity(:miles => 1000, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school3.id)

      school1.add_activity(activity)
      school1.add_activity(activity2)
      school1.add_activity(activity3)
      school4.add_activity(activity4)
      school1.add_activity(activity5)
      school2.add_activity(activity6)

      expect(db.get_city_ranking("Houston").size).to eq(2)
      expect(db.get_city_ranking("Houston")[0].total_miles_school).to eq(school1.total_miles_school)
    end

    it "gets activities for a school" do
      user = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
      school1 = db.create_school(:name=> "Kempner",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Houston", :user_id => user.id)
      school2 = db.create_school(:name=> "Dulles",:street=>"14777 Voss Rd",:state=>"California",:city=>"Sugar", :user_id => user.id)

      activity = db.create_activity(:miles => 300, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school1.id)
      activity2 = db.create_activity(:miles => 200, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school1.id)
      activity3 = db.create_activity(:miles => 100, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school2.id)

      school1.add_activity(activity)
      school1.add_activity(activity2)
      school2.add_activity(activity3)

      list_activity = db.get_activities_for_school(school1.id)
      expect(list_activity.length).to eq 2


      expect(school1.total_miles_school).to eq 500
    end


end
