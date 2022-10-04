require "test_helper"

class CrudNotificationMailerTest < ActionMailer::TestCase
  test "ongroupcreatenotification" do
    mail = CrudNotificationMailer.ongroupcreatenotification
    assert_equal "Ongroupcreatenotification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "onjoingroupnotification" do
    mail = CrudNotificationMailer.onjoingroupnotification
    assert_equal "Onjoingroupnotification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "onsendrequestnotification" do
    mail = CrudNotificationMailer.onsendrequestnotification
    assert_equal "Onsendrequestnotification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
