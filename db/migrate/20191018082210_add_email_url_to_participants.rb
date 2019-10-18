class AddEmailUrlToParticipants < ActiveRecord::Migration[5.1]
  def change
    add_column :participants, :email_url, :string
  end
end
