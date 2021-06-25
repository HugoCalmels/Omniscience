class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

     before_action :configure_permitted_parameters, if: :devise_controller?

     helper_method  :signed_in?, :is_admin?

     def signed_in?
          !!current_user
     end

     def is_admin?
          signed_in? ? current_user.admin : false
     end


     protected
          def configure_permitted_parameters
               devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password)}
               devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :avatar)}
          end


end
