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
    emails.each do |email|
      receivers = emails.select { |receiver| receiver != email }
      receiver = receivers.sample
      self.participants << Participant.new(email: email, receiver: receiver)
    end
  end

end
