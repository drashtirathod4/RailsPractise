class UserMailer < ApplicationMailer
    def welcome_email(user)
        @user = user
        attachments.inline['welcome.png'] = File.read('/home/drashtirathod/Downloads/welcome.png')
        mail(to: @user.email, subject: 'Welcome User') do |format|
            format.html { render layout: 'my_layout' }
        end
    end

    def promotion_mail(user)
        @user = user
        mail(to: @user.email, subject: 'Hello User') do |format|
            format.html
        end
    end
end
