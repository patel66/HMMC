require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "sign_up_mail" do
    # mail = UserMailer.sign_up_mail
    # assert_equal "Sign up mail", mail.subject
    # assert_equal ["to@example.org"], mail.to
    # assert_equal ["from@example.com"], mail.from
    # assert_match "Hi", mail.body.encoded

    db = HMMC.db
    new_user = HMMC.db.create_user(:name=> "Hubert", :email=> "hubertanguyen@gmail.com", :password => 123)

    new_school = HMMC.db.create_school(:name => "Kempner High School", :street => "123 Voss Road", :city => "Sugar Land", :state => "Texas", :user_id => new_user.id, :students => 700)

    # Construct the email
    email = UserMailer.sign_up_mail(new_user.id,new_school.id)

    #Then send it
    email.deliver



    # This ensures the email was delivered
    assert_not ActionMailer::Base.deliveries.empty?

    # Ensure proper postage

    assert_equal ['me@example.com'], email.from
    assert_equal ['friend@example.com'].emai.to
  end

end


# class UserMailerTest < ActionMailer::TestCase
#   test "new_comment" do



#     # Decoupled Rails
#     db = MyApp.db
#     user = db.create_user(email: 'jojo@mailinator.com')
#     video = db.create_video(user_id: user.id, name: 'My Video')
#     comment = db.create_comment(content: 'hello', user_id: user.id, video_id: video.id)

#     # Construct the email
#     email = UserMailer.new_comment(user.id, comment.id)
#     # Then send it
#     email.deliver

#     # This ensures the email was delivered
#     assert_not ActionMailer::Base.deliveries.empty?

#     # Ensure proper postage
#     assert_equal ['me@example.com'], email.from
#     assert_equal ['friend@example.com'], email.to

#     # Ensure subject contains key information
#     assert_includes email.subject, video.name
#     assert_match(/commented on your video/i, email.subject) # i means case-insensitive

#     # Ensure the body of the sent email contains key information
#     assert_includes email.body.to_s, video.name
#     assert_includes email.body.to_s, comment.content
#   end
# end
