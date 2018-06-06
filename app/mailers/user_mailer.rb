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

  def receipt(id) #change the following line of code
    @renter = renter
    temp_pdf_file = Tempfile.new(["contrat-de-location", ".pdf"])
    File.open(temp_pdf_file, 'wb') do |file|
      file << open(@renter.rental.lease_pdf.url).read
    end
    attachments['contrat-de-location.pdf'] = File.read(temp_pdf_file.path)
    mail to: @renter.email, subject: 'Bonjour'
  end

  def inventory(id) #change the following line of code
    @renter = renter
    temp_pdf_file = Tempfile.new(["contrat-de-location", ".pdf"])
    File.open(temp_pdf_file, 'wb') do |file|
      file << open(@renter.rental.lease_pdf.url).read
    end
    attachments['contrat-de-location.pdf'] = File.read(temp_pdf_file.path)
    mail to: @renter.email, subject: 'Bonjour'
  end
end
