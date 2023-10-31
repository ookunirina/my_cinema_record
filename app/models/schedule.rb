class Schedule < ApplicationRecord
  belongs_to :user

  after_create :schedule_reminder
  before_update :cancel_existing_reminder, if: :will_save_change_to_start_time?
  after_update :schedule_reminder, if: :saved_change_to_start_time?
  before_destroy :cancel_existing_reminder

  validates :title, presence: true
  validates :start_time, presence: true

  private

  def schedule_reminder
    reminder_time = self.reminder_time || 0
    job = ReminderJob.set(wait_until: self.start_time - reminder_time.minutes).perform_later(self.user, self)
    self.update_column(:job_id, job.provider_job_id)
  end

  def cancel_existing_reminder
    job = ::Delayed::Job.find_by(id: self.job_id)
    job&.destroy
  end
end
