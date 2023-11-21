class ApplicationMailer < ActionMailer::Base
  default from: "My Cinema Record <#{ENV['GMAIL_ADDRESS']}>"
  layout 'mailer'
end
