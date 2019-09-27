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


#à retravailler --> participant doit être créé en même temps et je dois lui assigner un array.


  def assign_random_email_to_participant(emails)

  end


end
