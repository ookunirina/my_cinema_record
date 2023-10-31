class AddReminderTimeToSchedules < ActiveRecord::Migration[7.0]
  def change
    add_column :schedules, :reminder_time, :integer
  end
end
