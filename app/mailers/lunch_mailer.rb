class LunchMailer < ActionMailer::Base
  default from: "chefs@pepperlunch.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.lunch_mailer.data_update_notification.subject
  #
  def data_update_notification(user)
    @greeting = "FREE PEPPERLUNCH@@!!!!!111111"

    @lunch_count = user.lunches.count

    if @lunch_count > 15


    mail to: user.email
  end
end
