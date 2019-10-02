class Event < ApplicationRecord
  has_many :participants, dependent: :destroy
  validates :name, :budget, :location, :date, presence: true

  def randomize(participants)
    result = {}
    participants.each do |giver|
      receiver = participants.select { |receiver| receiver != giver }
      result[giver] = receiver.sample
    end
  end

  def add_participant(emails)
    emails_already_assigned = []
    emails.each do |email|
      receiver = (emails-emails_already_assigned).select { |receiver| receiver != email }.sample
      emails_already_assigned << receiver
      self.participants << Participant.new(email: email, receiver: receiver)
    end
  end

  def self.cooc
  end

end
