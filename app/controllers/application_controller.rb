class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end

  # Overide Devise invitation to manage permissions
  def authenticate_inviter!
    send(:"authenticate_#{resource_name}!", force: true).tap do |inviter|
      @current_ability = ::Ability.new(inviter)
      authorize! :invite, User
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:invite, keys: [:admin])
    devise_parameter_sanitizer.permit(:accept_invitation, keys: %i[first_name last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[password password_confirmation current_password])
  end
end
