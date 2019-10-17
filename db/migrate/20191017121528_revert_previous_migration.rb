class RevertPreviousMigration < ActiveRecord::Migration[5.1]
  def change
    revert AddEventToUser
  end
end
