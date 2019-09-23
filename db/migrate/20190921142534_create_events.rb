class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :date
      t.string :location
      t.string :budget

      t.timestamps
    end
  end
end
