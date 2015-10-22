ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.mandrillapp.com",
  :port                 => 587,
  :domain               => "mail.authsmtp.com",
  :user_name            => ENV['mandrillapp_username'],
  :password             => ENV['mandrillapp_password'],
}