class ReminderJob < ApplicationJob
  queue_as :default

  def perform(user, schedule)
    ScheduleMailer.reminder_email(user, schedule).deliver_now
  end
end
