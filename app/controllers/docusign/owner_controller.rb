class Docusign::OwnerController < ApplicationController
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
      name: @rental.housing.user.full_name,
      email: @rental.housing.user.email,
      return_url: docusign_response_rental_docusign_owner_url(@rental)
    )["url"]
  end

  def docusign_response
    utility = DocusignRest::Utility.new

    if params[:event] == "signing_complete"
      @rental.update!(signed_by_owner: true)
      flash[:notice] = "Merci pour votre signature."
    else
      flash[:notice] = "Vous avez refusé de signer le contrat."
    end

    return render plain: utility.breakout_path(rental_path(@rental)), content_type: 'text/html'
  end

  private

  def set_rental
    @rental = Rental.find(params[:rental_id])
    authorize @rental
  end
end
