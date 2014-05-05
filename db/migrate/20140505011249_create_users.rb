class CreateUsers < ActiveRecord::Migration
  def change
    # TODO
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.references :school
    end
  end
end

