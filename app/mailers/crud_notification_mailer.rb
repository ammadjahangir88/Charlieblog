class CrudNotificationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.crud_notification_mailer.ongroupcreatenotification.subject
  #
  def ongroupcreatenotification(object)
    @object=object
    @object_count = object.class.count
    mail(to: "ammadjahangir12@gmail.com", from: 'ammadjahangir88@gmail.com', subject: "A new member in #{object.class}  has been added" , message: "Hi")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.crud_notification_mailer.onjoingroupnotification.subject
  #
  def onjoingroupnotification(object)
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.crud_notification_mailer.onsendrequestnotification.subject
  #
  def onsendrequestnotification(object)
  end
end
