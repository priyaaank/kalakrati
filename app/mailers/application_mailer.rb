class ApplicationMailer < ActionMailer::Base
  default from: ENV['KALAKRATI_EMAIL']
  # layout 'mailer'
end
