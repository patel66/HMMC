module HMMC
  class User < Entity
     # one-to-one relationship                   #school_id , later?
    attr_accessor :id, :name, :email, :password, :school, :school_id

  end
end
