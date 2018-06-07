require 'digest/md5'

class ProfilesController < ApplicationController
  def edit
    authorize(current_user)
  end

  def update
    authorize current_user
    current_user.update(user_params)
    redirect_to housings_path
  end

  private

  def user_params
    params.require(:user).permit(:street, :zip_code, :city, :phone_number, :nationality)
  end
end
