class ApplicationController < ActionController::Base
  add_flash_types :info, :error, :warning
  before_action :authenticate_user!
  include Pundit::Authorization

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    attibutes = [:email, :username, :password, :password_confirmation]
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: attibutes)
    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: attibutes)
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  private

  def skip_pundit?
    # return action_name == "" if ...
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
