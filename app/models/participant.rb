class Participant < ApplicationRecord
  belongs_to :event
  validates :email, presence: true

end
