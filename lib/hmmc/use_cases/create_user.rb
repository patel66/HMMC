module HMMC
  class CreateUser < UseCase
    def run(params)
      #Assume required login information is just email address, password, school

      email = params[:email]
      password = params[:password]
      school = params[:school]
      if validate_password(password) == false
        return failure :invalid_password
      end
      if validate_email(email)
        return failure :email_not_valid
      end
      if has_school(school)
        return failure :not_valid_school
      end

      #If all else is good, creates a user model.
      new_user = HMMC.db.create_user(params)

      return success :user => new_user
    end

    def has_school(school)
      #Valid school, return true for now.
      return true
    end

    def validate_email(email)
      # Makes sure email is a valid email address
      email =~ /\A(\S+)@(.+)\.(\S+)\z/
    end

    def validate_password(password)
      # Makes sure password gets passed in as a string, and is longer than 6 characters
      password.is_a?(string) && password.length > 6
    end

  end
end
