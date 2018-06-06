class Docusign::RenterController < ApplicationController
  skip_before_action :authenticate_user!
  skip_after_action  :verify_authorized

  before_action :set_rental

  # the view corresponding to this action has the iframe in it with the
  # @url as it's src. @envelope_response is populated from either:
  # @envelope_response = client.create_envelope_from_document
  # or
  # @envelope_response = client.create_envelope_from_template
  def signing
    client = DocusignRest::Client.new

    @docusign_url = client.get_recipient_view(
      envelope_id: @rental.lease_docusign_envelope_id,
      name: @rental.renter.full_name,
      email: @rental.renter.email,
      return_url: docusign_response_rental_docusign_renter_url(@rental.renter_token)
    )["url"]
  end

  def docusign_response
    utility = DocusignRest::Utility.new

    if params[:event] == "signing_complete"
      @rental.update!(signed_by_renter: true)
      flash[:notice] = "Merci pour votre signature."
    else
      flash[:notice] = "Vous avez refusé de signer le contrat."
    end

    return render plain: utility.breakout_path(signing_rental_docusign_renter_url(@rental.renter_token)), content_type: 'text/html'
  end

  private

  def set_rental
    @rental = Rental.find_by(renter_token: params[:rental_id])
  end
end
