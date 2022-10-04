# Preview all emails at http://localhost:3000/rails/mailers/crud_notification_mailer
class CrudNotificationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/crud_notification_mailer/ongroupcreatenotification
  def ongroupcreatenotification
    CrudNotificationMailer.ongroupcreatenotification
  end

  # Preview this email at http://localhost:3000/rails/mailers/crud_notification_mailer/onjoingroupnotification
  def onjoingroupnotification
    CrudNotificationMailer.onjoingroupnotification
  end

  # Preview this email at http://localhost:3000/rails/mailers/crud_notification_mailer/onsendrequestnotification
  def onsendrequestnotification
    CrudNotificationMailer.onsendrequestnotification
  end

end
