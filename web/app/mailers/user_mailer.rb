class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.sign_up_mail.subject
  #
  def sign_up_mail(user_id,school_id)
    # @greeting = "Hi"

    # mail to: "to@example.org"


    @user = HMMC.db.get_user(user_id)
    @school = HMMC.db.get_school(school_id)

    mail(
       from: "notifier@my-app.com",
       to: @user.email,
       subject: "Thank you for registering with the Hundread millionaire mile club"
     )
  end
end


# UserMailer.sign_up_mail(@user.id,@school.id)


# def new_comment(user_id, comment_id)
#     # Standard Rails
#     # @user = User.find(user_id)
#     # @comment = Comment.find(comment_id)
#     # @video = Video.find(video_id)

#     # Decoupled Rails
#     @user = MyApp.db.get_user(user_id)
#     @comment = MyApp.db.get_comment(comment_id)
#     @video = MyApp.db.get_video(@comment.video_id)

#     mail(
#       from: "notifier@my-app.com",
#       to: @user.email,
#       subject: "#{@comment.user} commented on your video #{@video.name}"
#     )
#   end
