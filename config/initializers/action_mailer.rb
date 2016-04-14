# config/initializers/action_mailer.rb
if Rails.env.development?
  Rails.application.config.action_mailer.tap do |action_mailer|
    action_mailer.default_url_options = {
      host: 'jirails.dev',
      port: 3000
    }

    action_mailer.delivery_method = :smtp
    action_mailer.perform_deliveries = true
    action_mailer.raise_delivery_errors = true
    action_mailer.smtp_settings = {
      address: '127.0.0.1',
      port: 1025
    }
  end
end

if Rails.env.production?
  Rails.application.config.action_mailer.tap do |action_mailer|
    action_mailer.default_url_options = {
      host: 'jirails.com'
    }

    action_mailer.delivery_method = :smtp
    action_mailer.perform_deliveries = true
    action_mailer.raise_delivery_errors = true
    # TODO: Set SMTP settings for Production Environment...
    action_mailer.smtp_settings = {
      #address: '127.0.0.1',
      #port: 1025
    }
  end
end
