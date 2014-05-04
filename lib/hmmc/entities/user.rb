module HMMC
  class User < Entity
     # one-to-one relationship
    attr_accessor :id, :name, :email, :password, :school

    # def intialize(data)
    # 	@id = data[:id]
    # 	@name = data[:name]
    # 	@email = data[:email]
    # 	@password = data[:password]
    # 	@school = data[:school]
    # end
  end
end
