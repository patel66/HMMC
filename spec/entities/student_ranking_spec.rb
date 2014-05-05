require 'spec_helper.rb'

describe HMMC::StudentRanking do

  xit "A studentRanking should be a studenRanking object" do
    new_student_ranking = HMMC::StudentRanking.new
    expect(new_student_ranking.class).should == HMMC::StudentRanking
  end

  xit "StudentRanking should initialize with an attribute called students that is a Hash" do
    new_student_ranking = HMMC::StudentRanking.new
    expect(new_student_ranking.students.class).should == Hash
  end

  xit "students in StudentRanking should initalize to be empty" do
    new_student_ranking = HMMC::StudentRanking.new
    expect(new_student_ranking.students.empty?).to eq true
  end

  xit "A user should be able to add students and miles to a StudentRanking" do
    new_student_ranking = HMMC::StudentRanking.new
    new_student_ranking.add_student("Bob",25)
    expect(new_student_ranking.students["Bob"]).to eq 25
  end
end
