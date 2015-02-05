class Users::RegistrationsController < Devise::RegistrationsController
  def update
    # required for settings form to submit when password is left blank
    if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
    end

    @user = User.find(current_user.id)

    if @user.update_attributes(user_params)
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, bypass: true
      redirect_to root_path
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:time_zone, :password, :password_confirmation)
  end

  def after_sign_up_path_for(resource)
    new_reminder_path
  end
end
