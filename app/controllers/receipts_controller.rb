class ReceiptsController < ApplicationController

  def new
    @rental = Rental.find(params[:rental_id])
    @receipt  = Receipt.new
    authorize @receipt
  end

  def show
    @receipt   = Receipt.find(params[:id])
    rental_id  = @receipt.rental_id
    @rental    = Rental.find(rental_id)
    housing_id = @rental.housing_id
    @renter    = Renter.find_by rental_id: @rental_id
    @housing   = Housing.find(housing_id)
    authorize @receipt
  end

  def create
    @receipt = Receipt.new(receipt_params)
    @rental = Rental.find(params[:rental_id])
    @receipt.rental = @rental
    @receipt.monthly_invoice = @rental.monthly_rent + @rental.monthly_expenses
    authorize @receipt
    if @receipt.save
      redirect_to receipt_path(@receipt), notice: 'Votre quittance a bien été crée.'
    else
      render :new
    end
  end

  def receipt_params
    params.require(:receipt).permit(:date)
  end
end
