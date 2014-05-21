class Changelatlongcolumnforschool < ActiveRecord::Migration
  def change
    # TODO
    remove_column(:schools,:lat,:integer)
    remove_column(:schools,:long,:integer)
  end
end
