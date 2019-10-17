ActionMailer::Base.smtp_settings = {
  address: 'smtp.sendgrid.net',
  port: 587,
  user_name: ENV['SENDGRID_ADDRESS'],
  password: ENV['SENDGRID_APP_PASSWORD'],
  domain: 'service@liine.io',
  authentication: :plain,
  enable_starttls_auto: true
}
