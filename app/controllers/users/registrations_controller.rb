# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  before_action :redirect_already_sign_in


  def new
    @user = User.new
  end

  def create
    @user = User.new(sign_up_params)
  
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    # @profile = @user.build_profile
    session["profile_data"] = @user.build_profile
    # binding.pry
    respond_with resource, location: after_sign_up_path_for(resource)
  end

  def create_profile
    @user = User.new(session["devise.regist_data"]["user"])
    @profile = Profile.new(profile_params)
    unless @profile.valid?
      flash.now[:alert] = @profile.errors.full_messages
      render :new_profile and return
    end
    @user.build_profile(@profile.attributes)
    session["profile"] = @profile.attributes
    @address = @user.build_address
    render :new_address
  end

  def create_address
 
    @user = User.new(session["devise.regist_data"]["user"])
   
    @profile = Profile.new(session["profile"])
    @address = Address.new(address_params)
    unless @address.valid?
      flash.now[:alert] = @address.errors.full_messages
      render :new_address and return
    end
    @user.build_profile(@profile.attributes)
    @user.build_address(@address.attributes)
    @user.save
    sign_in(:user, @user)
  end

  def confirm
    @profile = Profile.new(session["profile_data"])
  end
    


  protected

  def profile_params
    params.require(:profile).permit(:birthyear, :birthmonth, :birthday, :family_name, :personal_name, :family_name_kana, :personal_name_kana)
  end  

  def address_params
    params.require(:address).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :zipcode, :prefecture, :city, :address, :apartment)
  end

  def after_sign_up_path_for(resource)
    confirm_path
  end

  def redirect_already_sign_in
    redirect_to root_path if user_signed_in?
  end


  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
end
