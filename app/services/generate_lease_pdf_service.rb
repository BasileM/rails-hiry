class GenerateLeasePdfService
  def initialize(rental)
    @rental = rental
  end

  def call
    generate_pdf
    save_temporary_pdf_file
    save_pdf_to_cloudinary
  end

  private

  def generate_pdf
    html_pdf = ApplicationController.render(
      formats: :html,
      template: 'rentals/show.pdf.erb',
      assigns: {
        owner: @rental.housing.user,
        renter: @rental.renter,
        housing: @rental.housing,
        rental: @rental
      }
    )

    @pdf = WickedPdf.new.pdf_from_string(html_pdf)
  end

  def save_temporary_pdf_file
    @temp_pdf_file = Tempfile.new(["contrat-de-location", ".pdf"])

    File.open(@temp_pdf_file, 'wb') do |file|
      file << @pdf
    end
  end

  def save_pdf_to_cloudinary
    @rental.lease_pdf = File.open(@temp_pdf_file.path)
    @rental.save
  end
end
