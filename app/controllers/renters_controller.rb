class RentersController < ApplicationController

  def new
    @rental = Rental.find(params[:rental_id])
    @renter = Renter.new
    authorize @renter
  end

  def create
    @rental = Rental.find(params[:rental_id])
    @renter = Renter.new(rental_params)
    @renter.rental = @rental
    authorize @renter
    if @renter.save!
      redirect_to housing_path(@rental.housing), notice: 'Renter was successfully created.'
    else
      render :new
    end
  end


  private

  def rental_params
    params.require(:renter).permit(
      :first_name,
      :last_name,
      :phone_number,
      :email,
      :nationality,
      :date_of_birth,
      :marital_status
    )
  end
end
