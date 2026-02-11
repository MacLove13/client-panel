class ApplicationMailer < ActionMailer::Base
  default from: ENV.fetch("MAILER_SENDER", "contato@prifresh.com.br")
  layout "mailer"
end
