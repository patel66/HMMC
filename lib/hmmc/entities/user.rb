module HMMC
  class User < Entity
     # one-to-one relationship                   #school_id , later?
    attr_accessor :id, :name, :email, :password, :school_id, :school # add other schoolattributes

  end
end
