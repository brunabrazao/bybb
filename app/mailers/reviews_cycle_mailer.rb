class ReviewsCycleMailer < ApplicationMailer
  def notify_user(reviews_cycle)
    @reviews_cycle = reviews_cycle
    users = reviews_cycle.users

    users.each do |user|
      mail(to: user.email, subject: 'You have been invited to submit a review')
    end
  end
end
