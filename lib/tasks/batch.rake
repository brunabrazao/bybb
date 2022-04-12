namespace :batch do
  desc 'Send notification for all review cycles that are not stamped with a notification status'
  task send_notification: :environment do
    reviews_cycles = ReviewsCycle.ready

    reviews_cycles.each do |cycle|
      next unless cycle.review_request_date == Date.current && !cycle.notification_sent

      cycle.users.each do |user|
        ReviewsCycleMailer.notify_user(user).deliver_now
        cycle.notification_sent = true
        cycle.save
      end
    end
  end
end
