class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_order, :current_order_items_count

  def current_order
    if session[:order_id].nil?
      Order.new
    else
      Order.find_by(id: session[:order_id])
    end
  end

  def current_order_items_count
    if session[:order_id].nil?
      0
    else
      order = Order.find_by(id: session[:order_id])
      order.order_items.count if order
    end
  end

  protected
    def configure_permitted_parameters
      added_attributes = [:first_name, :last_name, :username, :mobile_number, :profile_picture, :email, :password, :password_confirmation, :remember_me]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attributes
      devise_parameter_sanitizer.permit :account_update, keys: added_attributes
    end
end
