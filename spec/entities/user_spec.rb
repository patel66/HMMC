require 'spec_helper'

module HMMC

	describe "User" do
		it 'initializes with name, id, email, password, school' do
			coach = User.new({name: "Zeus", id: 1, email: "zeus@gods.com", password: "greece", school: "Academi"})

			expect(coach.name).to eq('Zeus')
			expect(coach.id).to eq(1)
			expect(coach.email).to eq('zeus@gods.com')
			expect(coach.password).to eq('greece')
			expect(coach.school).to eq('Academi')

		end
	end
end