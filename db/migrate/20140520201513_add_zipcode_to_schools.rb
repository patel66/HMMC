class AddZipcodeToSchools < ActiveRecord::Migration
  def change
    # TODO
    add_column(:schools,:zipcode,:integer)
    add_column(:schools,:lat,:integer)
    add_column(:schools,:long,:integer)
  end
end



