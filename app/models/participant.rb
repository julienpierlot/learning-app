class Participant < ApplicationRecord
  belongs_to :event
  validates :email, :receiver, :email_token, presence: true

  def self.generate_token
   begin
     email_token = loop do
       random_token = SecureRandom.urlsafe_base64(nil, false)
       break random_token unless self.exists?(email_token: random_token)
    end
   end
  end

end
