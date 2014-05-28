class Schoolgoal < ActiveRecord::Migration
  def change
    # TODO
    add_column(:schools,:goal,:integer)
  end
end
