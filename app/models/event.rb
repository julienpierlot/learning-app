class Event < ApplicationRecord
  has_many :participants, dependent: :destroy
  belongs_to :user

  validates :name, :budget, :location, :date, presence: true

  after_create :send_email_to_participant

  def add_participant(emails)
    emails_already_assigned = []
    emails.each do |email|
      receiver = (emails - emails_already_assigned).select { |receiver| receiver != email }.sample
      emails_already_assigned << receiver
      self.participants << Participant.new(email: email, receiver: receiver, email_token: Participant.generate_token)
    end
  end

  def send_email_to_participant
    self.participants.each do |participant|
      EventMailer.participant_email(participant).deliver
    end
  end

end
