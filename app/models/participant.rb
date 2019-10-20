class Participant < ApplicationRecord
  belongs_to :event
  validates :email, :receiver, :email_token, presence: true

  def generate_token
   begin
    self.email_token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless self.class.exists?(email_token: token)
    end
   end
  end

end
