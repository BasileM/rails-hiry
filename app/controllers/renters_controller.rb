class RentersController < ApplicationController

  def new
    @rental = Rental.find(params[:rental_id])
    @renter = Renter.new
    authorize @renter
  end

  def create
    @renter = Renter.new(renter_params)
    @renter.rental = Rental.find(params[:rental_id])
    authorize @renter
    if @renter.save!
      UserMailer.contract(@renter).deliver_now
      redirect_to rental_path(@renter.rental), notice: 'Renter was successfully created.'
    else
      render :new
    end
  end


  private

  def renter_params
    params.require(:renter).permit(
      :gender,
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
