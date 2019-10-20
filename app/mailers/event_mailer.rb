class EventMailer < ApplicationMailer
  default from: "pierlot.julien@gmail.com"

  def participant_email(participant)
    @participant = participant
     @url = "#{url_for @participant}" + "?token=#{@participant.email_token}"
    mail(to: @participant.email, subject: "Guess who's your receiver?")
  end

end
