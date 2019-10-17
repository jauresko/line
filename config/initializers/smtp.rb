ActionMailer::Base.smtp_settings = {
  address: "smtp.postmarkapp.com",
  port: 587,
  user_name: ENV['POSTMARK_ADDRESS'],
  password: ENV['POSTMARK_APP_PASSWORD'],
  authentication:       :plain,
  enable_starttls_auto: true
}
