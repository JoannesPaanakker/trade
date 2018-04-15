class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :region_id, :address1, :address2, :postalcode, :city, :country, :phonenumber])
  end

  def after_sign_in_path_for(resource)
    @user = current_user
    stockitems_path
  end

  def shoesize
    if user_signed_in?
      @region = Region.find(@current_user.region_id)[:name]
      @shoesizes = Shoesize.where(region_id: @current_user.region_id)[0][:sizes].split ", "
    else
      @region = Region.where(name: "EU")[0][:name] # default region: EU
      @region_id = Region.where(name: "EU")[0][:id]
      @shoesizes = Shoesize.where(region_id: @region_id)[0][:sizes].split ", "
    end
  end
end
