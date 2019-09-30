class AddReceiverToParticipant < ActiveRecord::Migration[5.1]
  def change
    add_column :participants, :receiver, :string
  end
end
