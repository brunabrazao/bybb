class ReviewsCycleMailer < ApplicationMailer
  def notify_user(user)
    @user = user
    @reviews_cycle = @user.reviews_cycles.last

    mail(to: user.email, subject: 'You have been invited to submit a review')
  end
end
