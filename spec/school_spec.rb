require 'spec_helper'

	describe "User" do
		it 'initializes with name, id, email, password, school' do
			school = HMMC::School.new({id: 1, :name=> "Kempner HighSchool", :address=> {:street=>"14777 Voss Rd",:state=>"Texas",:city=>"Sugar Land"},:miles=> 0})

			expect(school.name).to eq("Kempner HighSchool")
			expect(school.id).to eq(1)

		end
	end
