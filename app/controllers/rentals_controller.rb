class RentalsController < ApplicationController

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
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "rental"
      end
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:furnished, :start_date, :end_date, :monthly_rent, :monthly_expenses)
  end
end
