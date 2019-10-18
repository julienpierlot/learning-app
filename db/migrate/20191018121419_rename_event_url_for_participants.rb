class RenameEventUrlForParticipants < ActiveRecord::Migration[5.1]
  def change
    rename_column :participants, :email_url, :email_token
  end
end
