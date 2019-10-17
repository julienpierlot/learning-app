class AddEventsIdToUser < ActiveRecord::Migration[5.1]
  def change
      add_reference :users, :events, foreign_key: true
  end
end
