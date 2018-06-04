class RentalsController < ApplicationController
  before_action :user_info_completed, only: [ :new ]

  def new
    @housing = Housing.find(params[:housing_id])
    @rental  = Rental.new
    authorize @rental
  end

  def create
    @rental = Rental.new(rental_params)
    @rental.housing = Housing.find(params[:housing_id])
    authorize @rental
    if @rental.save!
      redirect_to new_rental_renter_path(@rental), notice: 'Rental was successfully created.'
    else
      render :new
    end
  end

  def show
    @rental = Rental.find(params[:id])
    @housing = Housing.find(@rental.housing_id)
    @owner = current_user
    @renter = @rental.renter
    authorize @rental
  end

  private

  def user_info_completed
    if current_user.street.nil? && current_user.zip_code.nil? && current_user.city.nil? && current_user.phone_number.nil? && current_user.nationality.nil? && current_user.marital_status.nil?
      redirect_to profile_edit_path, notice: "Completer vos infos pour pouvoir créer une location"
      return
    end
  end

  def rental_params
    params.require(:rental).permit(:furnished, :start_date, :end_date, :monthly_rent, :monthly_expenses)
  end
end
