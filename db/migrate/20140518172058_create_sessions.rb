class CreateSessions < ActiveRecord::Migration
  def change
    # TODO
    create_table :sessions do |t|
      t.integer :user_id
      t.string :session_key
      t.timestamps
    end
  end
end


# def change
#     # TODO
#     create_table :sessions do |t|
#   # TODO
#       t.integer :user_id
#       t.string :session_key
#       t.timestamps
#     end
