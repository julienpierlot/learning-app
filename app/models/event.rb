class Event < ApplicationRecord
  has_many :participants, dependent: :destroy
  belongs_to :user
  validates :name, :budget, :location, :date, presence: true

  def add_participant(emails)
    emails_already_assigned = []
    emails.each do |email|
      receivers = (emails - emails_already_assigned).select { |receiver| receiver != email }.sample
      emails_already_assigned << receiver
      self.participants << Participant.new(email: email, receiver: receiver)
    end
  end

end
