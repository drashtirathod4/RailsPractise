class ApplicationController < ActionController::Base
    helper_method :current_user
    
    def current_user
        User.find_by(id: session[:user_id])
    end
    
    def logged_in?
        !current_user.nil?
    end

    private
    def require_login
        unless logged_in?
        flash[:notice] = "You must be logged in to access that section"
        redirect_to '/login' # halts request cycle
        end
    end


    def generate_pdf(user)
      Prawn::Document.new do
        text user.name, align: :center
        text "Name: #{user.name}"
        text "Email: #{user.email}"
      end.render
    end
end
