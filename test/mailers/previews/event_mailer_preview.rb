# Preview all emails at http://localhost:3000/rails/mailers/event_mailer
class EventMailerPreview < ActionMailer::Preview
  def participant_email_preview
      EventMailer.participant_email(Participant.first)
    end
end
