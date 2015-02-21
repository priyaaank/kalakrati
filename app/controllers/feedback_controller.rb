class FeedbackController < ApplicationController

  skip_before_action :verify_authenticity_token, :only => [:create]

  def create
    feedback = Feedback.new(params[:name], params[:email], params[:message])
    FeedbackMailer.send_feedback(feedback).deliver
    render :status => 200, :nothing => true
  end

end