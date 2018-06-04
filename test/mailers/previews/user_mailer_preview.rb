# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/contract
  def contract
    renter = Renter.first
    UserMailer.contract(renter)
  end

end
