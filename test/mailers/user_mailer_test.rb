require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  def contract
    renter = Renter.first
    UserMailer.contract(renter)


  # test "contract" do
  #   mail = UserMailer.contract
  #   assert_equal "Contract", mail.subject
  #   assert_equal ["to@example.org"], mail.to
  #   assert_equal ["from@example.com"], mail.from
  #   assert_match "Hi", mail.body.encoded
  # end

end
