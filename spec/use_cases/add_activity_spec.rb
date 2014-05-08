require 'spec_helper'

module HMMC
	describe HMMC::CreateActivity do
	  let(:db) { HMMC.db }
	  before do
      @user1 = HMMC.db.create_user(:name => "John", :email=> "John@mail.com", :password => "password")
	    @school = db.create_school(:name=> "Kempner HighSchool", :address=> {:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land"},:miles=> 0, :user_id => @user1.id, :students => 200)
      end

    it 'creates a Activity with miles' do
      result = HMMC::CreateActivity.run({:school_id => @school.id, :miles => 10, :students => 20, :date => Time.parse("May 8 2014")})

    	expect(result.success?).to eq true
    	expect(result.activity.miles).to eq 10
    end

    it 'returns a failure if too many students have been entered' do
    	result = HMMC::CreateActivity.run({:school_id => @school.id, :miles => 10, :students => 2033, :date => Time.parse("May 8 2014")})

    	expect(result.success?).to eq false
    	expect(result.error).to eq :invalid_number_students
    end

    it 'returns a failure if no students have been entered' do
    	result = HMMC::CreateActivity.run({:school_id => @school.id, :miles => 10, :date => Time.parse("May 8 2014")})

    	expect(result.success?).to eq false
    	expect(result.error).to eq :no_students
    end

	  it 'returns a failure if no miles have been entered' do
    	result = HMMC::CreateActivity.run({:school_id => @school.id, :students => 20, :date => Time.parse("May 8 2014")})
    	expect(result.success?).to eq false
    	expect(result.error).to eq :no_miles
    end

    it "returns the school with all the total miles of all activites" do
      result1 = HMMC::CreateActivity.run({:school_id => @school.id, :miles => 10, :students => 20, :date => Time.parse("May 8 2014")})
      result2 = HMMC::CreateActivity.run({:school_id => @school.id, :miles => 20, :students => 20, :date => Time.parse("May 8 2014")})
      result3 = HMMC::CreateActivity.run({:school_id => @school.id, :miles => 30, :students => 20, :date => Time.parse("May 8 2014")})
      # binding.pry
      expect(result3.school.total_miles_school).to eq 50
    end

 end
end
