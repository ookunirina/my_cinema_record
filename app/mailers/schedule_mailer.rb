class ScheduleMailer < ApplicationMailer
  def reminder_email(user, schedule)
    @user = user
    @schedule = schedule
    mail(to: @user.email, subject: '[My Cinema Record」公式サイト、カレンダー予定の通知です。')
  end
end
