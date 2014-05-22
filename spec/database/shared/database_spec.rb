
  shared_examples 'a database' do

    let(:db) { described_class.new('test')}
     before { db.clear_everything }

    it "creates a user" do

      user = db.create_user(:name => "John", :email=> "John@mail.com", :password_digest => "123")
      expect(user.name).to eq "John"
      expect(user.email).to eq "John@mail.com"
      expect(user.password_digest).to be_a(String)

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
      # binding.pry
      school = db.create_school(:name=> "Kempner HighSchool",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land", :zipcode =>77478, :lat => 34.4567, :long => -90.45456 )
      retreived_school = db.get_school(school.id)
      expect(retreived_school.name).to eq "Kempner HighSchool"
      expect(retreived_school.street).to eq "14777 Voss Rd"
      expect(retreived_school.state).to eq "Texas"
      expect(retreived_school.city).to eq "Sugar Land"
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
      user = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
      school = db.create_school(:name=> "Kempner",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land", :user_id => user.id, :students => 1500)
      student_rank = db.create_ranking(:school_id => school.id, :students => {:Joe=> 0, :Jessica=> 20, :Bob=>25})
      expect(student_rank.school_id).to eq school.id
      expect(student_rank.students.class).should == Hash
    end

    xit "gets a student ranking " do
       user = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
       school = db.create_school(:name=> "Kempner",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land", :user_id => user.id, :students => 1500)
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

    xit "updates a classroom" do
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
      updated_school = db.update_school({"id" => school.id, :students => 200})
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

    xit "gets classroom by name" do
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
      school1 = db.create_school(:name=> "Kempner",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land", :user_id => user.id, :zipcode => 77478, :lat => 34.3439, :long => -45.12)

      school2 = db.create_school(:name=> "Dulles",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land", :user_id => user.id, :zipcode => 91942, :lat => 34.3439, :long => -10.123)
      school3 = db.create_school(:name=> "Fort Minor",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land", :user_id => user.id, :zipcode => 78701, :lat => 53.2342, :long => 50.123)
      school4 = db.create_school(:name=> "Cypress",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land", :user_id => user.id, :zipcode => 77478, :lat => 41.245, :long => -90.123)

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

      school5 = db.create_school(:name=> "Douglass",:street=>"567 Dirk street",:state=>"Ohio",:city=>"Cleveland", :user_id => user.id, :zipcode => 34589, :lat => 41.245, :long => -90.123)
      school6 = db.create_school(:name=> "Douglass",:street=>"567 Dirk street",:state=>"Ohio",:city=>"Cleveland", :zipcode => 34589, :lat => 41.245, :long => -90.123)
      school7 = db.create_school(:name=> "Frankie High",:street=>"456 Main street",:state=>"New York",:city=>"Cleveland", :zipcode => 34589, :lat => 41.245, :long => -90.123)
      school8 = db.create_school(:name=> "Logan High",:street=>"1600 Lawrence street",:state=>"Lousiana",:city=>"Baton Rouge", :zipcode => 58343, :lat => 41.245, :long => -90.123)
      schools = db.get_all_schools_sign_up

      expect(schools.length).to eq 5
      expect(schools.map { |school| school.name}).to include('Kempner', 'Dulles', 'Fort Minor', "Cypress")
      expect(schools.map { |school| school.zipcode}).to include(77478,91942,78701)
      expect(schools.map { |school| school.lat}).to include(34.3439,34.3439,53.2342,41.245)
      expect(schools.map { |school| school.long}).to include(-10.123,50.123,-90.123)
    end

    it 'can rank all schools' do
      user = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
      school1 = db.create_school(:name=> "Kempner",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land", :user_id => user.id, :students => 1500)
      school2 = db.create_school(:name=> "Dulles",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land", :user_id => user.id, :students => 5000)
      school3 = db.create_school(:name=> "Fort Minor",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land", :user_id => user.id, :students =>800)
      school4 = db.create_school(:name=> "Cypress",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land", :user_id => user.id, :students => 2300)

      school5 = db.create_school(:name=> "Logan High",:street=>"213 Main St",:state=>"Texas",:city=>"El Paso", :students => 1600)

      activity = db.create_activity(:miles => 100, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school1.id)
      activity2 = db.create_activity(:miles => 100, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school1.id)
      activity3 = db.create_activity(:miles => 100, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school1.id)
      activity4 = db.create_activity(:miles => 1000, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school4.id)
      activity5 = db.create_activity(:miles => 100000, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school1.id)
      activity6 = db.create_activity(:miles => 100, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school2.id)
      activity7 = db.create_activity(:miles => 1000, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school3.id)

      activity8 = db.create_activity(:miles => 100000, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school5.id)
      activity9 = db.create_activity(:miles => 100000, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school5.id)
      activity10 = db.create_activity(:miles => 100000, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school5.id)
      activity11 = db.create_activity(:miles => 100000, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school5.id)
      activity12 = db.create_activity(:miles => 100000, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school5.id)

      school1.add_activity(activity)
      school1.add_activity(activity2)
      school1.add_activity(activity3)
      school4.add_activity(activity4)
      school1.add_activity(activity5)
      school2.add_activity(activity6)

      school5.add_activity(activity8)
      school5.add_activity(activity9)
      school5.add_activity(activity10)
      school5.add_activity(activity11)
      school5.add_activity(activity12)

      expect(school5.total_miles_school).to eq 500000
      schools = db.get_all_schools_sign_up
      expect(schools.length).to eq 4
      expect(db.get_national_ranking[0].total_miles_school).to eq(school1.total_miles_school)
    end

    it "can rank by state" do
      user = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
      school1 = db.create_school(:name=> "Kempner",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land", :user_id => user.id)
      school2 = db.create_school(:name=> "Dulles",:street=>"14777 Voss Rd",:state=>"California",:city=>"Sugar Land", :user_id => user.id)
      school3 = db.create_school(:name=> "Fort Minor",:street=>"14777 Voss Rd",:state=>"Ohio",:city=>"Sugar Land", :user_id => user.id)
      school4 = db.create_school(:name=> "Cypress",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land", :user_id => user.id)

      school5 = db.create_school(:name=> "Logan High",:street=>"213 Main St",:state=>"Texas",:city=>"El Paso", :students => 1600)

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

      activity8 = db.create_activity(:miles => 100000, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school5.id)
      activity9 = db.create_activity(:miles => 100000, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school5.id)
      activity10 = db.create_activity(:miles => 100000, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school5.id)
      activity11 = db.create_activity(:miles => 100000, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school5.id)
      activity12 = db.create_activity(:miles => 100000, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school5.id)

      school5.add_activity(activity8)
      school5.add_activity(activity9)
      school5.add_activity(activity10)
      school5.add_activity(activity11)
      school5.add_activity(activity12)

      expect(school5.total_miles_school).to eq 500000
      expect(school5.state).to eq "Texas"

      expect(db.get_state_ranking("Texas").size).to eq(2)

      expect(db.get_state_ranking("Texas")[0].total_miles_school).to eq(school1.total_miles_school)

    end

    it "can rank by city" do

      user = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
      school1 = db.create_school(:name=> "Kempner",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Houston", :user_id => user.id)
      school2 = db.create_school(:name=> "Dulles",:street=>"14777 Voss Rd",:state=>"California",:city=>"Sugar", :user_id => user.id)
      school3 = db.create_school(:name=> "Fort Minor",:street=>"14777 Voss Rd",:state=>"Ohio",:city=>"Austin", :user_id => user.id)
      school4 = db.create_school(:name=> "Cypress",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Houston", :user_id => user.id)

      school5 = db.create_school(:name=> "Diego High",:street=>"244 Montegromery Rd", :state=>"Texas",:city=>"Houston", :user_id => user.id)
      school6 = db.create_school(:name=> "Declaire",:street=>"456 Froth Rd", :state=>"Texas",:city=>"Houston", :user_id => user.id)

      activity = db.create_activity(:miles => 100, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school1.id)
      activity2 = db.create_activity(:miles => 100, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school1.id)
      activity3 = db.create_activity(:miles => 100, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school1.id)
      activity4 = db.create_activity(:miles => 1000, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school4.id)
      activity5 = db.create_activity(:miles => 100000, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school1.id)
      activity6 = db.create_activity(:miles => 100, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school2.id)
      activity7 = db.create_activity(:miles => 1000, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school3.id)

      activity8 = db.create_activity(:miles => 100000, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school5.id)
      activity9 = db.create_activity(:miles => 100000, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school5.id)

      school1.add_activity(activity)
      school1.add_activity(activity2)
      school1.add_activity(activity3)
      school4.add_activity(activity4)
      school1.add_activity(activity5)
      school2.add_activity(activity6)

      school5.add_activity(activity8)
      school5.add_activity(activity9)
      expect(school5.total_miles_school).to eq 200000
      expect(db.get_city_ranking("Houston").size).to eq(4)
      expect(db.get_city_ranking("Houston")[0].total_miles_school).to eq(school5.total_miles_school)
      expect(db.get_city_ranking("Houston")[0].name).to eq "Diego High"

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

    xit "can get activties for a school by month" do
      user = db.create_user(:name => "John", :email=> "John@mail.com", :password => "123")
      school1 = db.create_school(:name=> "Kempner",:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Houston", :user_id => user.id)

      activity = db.create_activity(:miles => 300, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school1.id)
      activity2 = db.create_activity(:miles => 200, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school1.id)
      activity3 = db.create_activity(:miles => 100, :students => 20, :date => Time.parse("May 8 2014"), :school_id => school2.id)
    end


end
