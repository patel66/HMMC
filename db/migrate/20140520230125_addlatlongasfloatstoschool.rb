class Addlatlongasfloatstoschool < ActiveRecord::Migration
  def change
    # TODO
    add_column(:schools,:lat,:float)
    add_column(:schools,:long,:float)
  end
end
