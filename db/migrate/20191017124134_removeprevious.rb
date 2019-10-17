class Removeprevious < ActiveRecord::Migration[5.1]
  def change
    revert AddEventsIdToUser
  end
end
