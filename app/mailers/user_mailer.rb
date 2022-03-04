class UserMailer < ApplicationMailer
    def welcome_email(user)
        @user = user
        # attachments['filename.jpg'] = File.read('/path/to/filename.jpg')
        mail(to: @user.email, subject: 'Welcome User')
    end
end
