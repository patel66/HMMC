class ChangeSchoolAddressfromhashtostrings < ActiveRecord::Migration
  def change
    # TODO
    add_column(:schools, :state, :string)
    add_column(:schools, :city, :string)
    add_column(:schools, :street, :string)
  end
end

