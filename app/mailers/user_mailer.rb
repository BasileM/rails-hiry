class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.contract.subject
  #
  def contract(renter)
    @renter  = renter
    @rental  = Rental.find(@renter.rental_id)
    @housing = Housing.find(@rental.housing_id)
    @owner   = User.find(@housing.user_id)

    mail(to: @renter.email, subject: 'Contrat de Location')
  end
end
