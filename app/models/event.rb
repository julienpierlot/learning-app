class Event < ApplicationRecord
  has_many :participants, dependent: :destroy
  accepts_nested_attributes_for :participants
end
