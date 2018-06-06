class CreateDocusignEnvelopService
  def initialize(rental)
    @rental = rental
  end

  def call
    # download cloudinary PDF file
    temp_pdf_file = Tempfile.new(["contrat-de-location", ".pdf"])

    File.open(temp_pdf_file, 'wb') do |file|
      file << open(@rental.lease_pdf.url).read
    end

    client = DocusignRest::Client.new
    document_envelope_response = client.create_envelope_from_document(
      email: {
        subject: "Signez votre contrat de location",
        body: "Trouvez ci-joint votre contrat!"
      },
      # If embedded is set to true in the signers array below, emails
      # don't go out to the signers and you can embed the signature page in an
      # iframe by using the client.get_recipient_view method
      signers: [
        {
          embedded: true,
          name: @rental.housing.user.full_name,
          email: @rental.housing.user.email,
          role_name: 'Issuer',
          sign_here_tabs: [
            {
              anchor_string: 'Signature du locataire',
              anchor_x_offset: '-30',
              anchor_y_offset: '35'
            }
          ]
        },
        {
          embedded: true,
          name: @rental.renter.full_name,
          email: @rental.renter.email,
          role_name: 'Attorney',
          sign_here_tabs: [
            {
              anchor_string: 'Signature du propriétaire',
              anchor_x_offset: '-30',
              anchor_y_offset: '35'
            },
          ]
         }
      ],
      files: [
        { path: temp_pdf_file.path, name: 'contrat-de-location.pdf' },
      ],
      status: 'sent'
    )

    binding.pry

    # url = client.get_recipient_view(
    #   envelope_id: document_envelope_response['envelopeId'],
    #   name: @rental.housing.user.full_name,
    #   email: @rental.housing.user.email,
    #   return_url: 'http://google.com'
    # )['url']
    # `open #{url}`
  end

end
