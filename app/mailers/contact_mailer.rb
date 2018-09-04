class ContactMailer < ApplicationMailer
  def contact_mail(tweet)
    @tweet = tweet
    mail to: @tweet.user.email, subject: "Blog作成のお知らせメール"
  end
end
