module HMMC
  class SignUp < UseCase
    def run(inputs)
      name = inputs[:name]
      email = inputs[:email]
      password = inputs[:password]

      check_if_email_taken = HMMC.db.get_user_by_email(email)
      return failure :invalid_name if name.empty?
      return failure :invalid_password if password.empty?
      return failure :email_already_in_use if check_if_email_taken != nil
      new_user = HMMC.db.create_user(:name=> name, :email=> email, :password => password)
      success(:user => new_user)
    end
  end
end


