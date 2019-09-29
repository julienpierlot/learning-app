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
      receiver = emails.select { |receiver| receiver != email }
      participant = Participant.new(email: email, receiver: receiver.sample)
      puts participant
      participant
    end
  end


end

# emails.each do |email|
#   participant = Participant.new(email: email)
#   @event.participants.push(participant)
# end
