class UserStepsController < ApplicationController
        include Wicked::Wizard
        steps :telephone,:address,:credit,:finish
      
        def show
            @user = current_user
            render_wizard
          end
        
      
        def update
          @user = current_user
          @user.attributes = user_params
          render_wizard @user
        end
      
        private
      
        def finish_wizard_path
          users_path(current_user)
        end
      
        def current_user
          User.find_by(id: session[:user_id])
        end
      
        def user_params
          params.require(:user).permit(:email, :password, :zip, :address, :message)
        end
      
end
