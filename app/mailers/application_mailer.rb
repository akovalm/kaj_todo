# frozen_string_literal: true

# ApplicationMailer comment
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
