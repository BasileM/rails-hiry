class ReceiptsController < ApplicationController

  def new
    @rental = Rental.find(params[:rental_id])
    @receipt  = Receipt.new
    authorize @receipt
  end

  def index
    @receipts  = policy_scope(Receipt)
    @rental    = Rental.find(params[:rental_id])
    @receipts  = Receipt.where(rental_id: @rental.id)
    rental_id  = @rental.id
    housing_id = @rental.housing_id
    @housing   = Housing.find(housing_id)
    @renter    = Renter.find_by(rental_id: rental_id)
    @housing   = Housing.find(housing_id)
    user_id    = @housing.user_id
    @user      = User.find(user_id)
  end

  def show
    @receipt   = Receipt.find(params[:id])
    rental_id  = @receipt.rental_id
    @rental    = Rental.find(rental_id)
    housing_id = @rental.housing_id
    @renter    = Renter.find_by(rental_id: rental_id)
    @housing   = Housing.find(housing_id)
    user_id    = @housing.user_id
    @user      = User.find(user_id)
    authorize @receipt
    respond_to do |format|
    format.html
    format.pdf  {render :pdf => "receipts/show.pdf.erb",
                        :template => 'receipts/show.pdf.erb', formats: :html, encoding: 'utf8'}
    end
  end

  def create
    @receipt = Receipt.new(receipt_params)
    @rental = Rental.find(params[:rental_id])
    @receipt.rental = @rental
    @receipt.monthly_invoice = @rental.monthly_rent + @rental.monthly_expenses
    authorize @receipt
    if @receipt.save
      redirect_to  rental_receipts_path(@rental), notice: 'Votre quittance a bien été crée.'
    else
      render :new
    end
  end

  def receipt_params
    params.require(:receipt).permit(:date)
  end
end
