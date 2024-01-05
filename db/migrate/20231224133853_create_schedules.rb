class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.string :title
      t.date :start_time
      t.date :end_time
      t.boolean :all_day
      t.text :memo

      t.timestamps
    end
  end
end
