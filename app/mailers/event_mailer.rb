class EventMailer < ApplicationMailer
  def subscription(event, subscription)
    @email = subscription.user_email
    @name = subscription.user_name
    @event = event

    # Берём у юзер его email
    # Subject тоже можно переносить в локали
    mail to: event.user.email, subject: I18n.t('actionmailer.mailers.event_mailer.subscription') + " #{event.title}"
  end

  def comment(event, comment, email)
    @comment = comment
    @event = event

    mail to: email, subject: I18n.t('actionmailer.mailers.event_mailer.comment') + " @#{event.title}"
  end
end
