class FeedbackMailer < ApplicationMailer

  def send_feedback(feedback)
    @feedback = feedback
    mail(
        to: "feedback.kalakrati@outlook.com",
        subject: "New Feedback from #{@feedback.from_name} [#{@feedback.from_email}]",
        template_name: 'new_feedback'
    )
  end

end
