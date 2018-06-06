class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.contract.subject
  #
  def contract(renter)
    @renter = renter
    temp_pdf_file = Tempfile.new(["contrat-de-location", ".pdf"])
    File.open(temp_pdf_file, 'wb') do |file|
      file << open(@renter.rental.lease_pdf.url).read
    end
    attachments['contrat-de-location.pdf'] = File.read(temp_pdf_file.path)
    mail to: @renter.email, subject: 'Bonjour'
  end

  def inventory(renter)
    @renter = renter
    temp_pdf_file = Tempfile.new(["etat-des-lieux", ".pdf"])
    File.open(temp_pdf_file, 'wb') do |file|
      file << open(@renter.rental.inventory_pdf.url).read
    end
    attachments['etat-des-lieux.pdf'] = File.read(temp_pdf_file.path)
    mail to: @renter.email, subject: 'Bonjour'
  end
end
