class UserMailer < ApplicationMailer
    def welcome_email(user)
        @user = user
        attachments.inline['welcome.png'] = File.read('app/assets/images/welcome.png')
        mail(to: email_address_with_name(@user.email, @user.name), subject: 'Welcome to this website') do |format|
            format.html { render layout: 'my_layout' }
            format.text { render layout: 'my_layout' }
        end
    end
end
