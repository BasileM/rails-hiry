class RentalsController < ApplicationController

  def new
    @housing = Housing.find(params[:housing_id])
    @rental = Rental.new
    @renter = Renter.new
    authorize @rental
  end

  def create
    @rental = Rental.new(rental_params)
    @rental.housing = Housing.find(params[:housing_id])
    authorize @rental
    raise
    redirect_to root_path, notice: 'Rental was successfully created.'
    # if @rental.save
    #   redirect_to root_path, notice: 'Rental was successfully created.'
    # else
    #   render :new
    # end
  end

  private

  def rental_params
    params.require(:rental).permit(:furnished, :start_date, :end_date, :monthly_rent, :monthly_expenses)
  end
end
