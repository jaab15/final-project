# Preview all emails at http://localhost:3000/rails/mailers/jpmailer_mailer
class JpmailerMailerPreview < ActionMailer::Preview
    def sample_mail_preview
      JpMailer.jpemail(User.first)
    end
end
