class FeedbackController < ApplicationController

  skip_before_action :verify_authenticity_token, :only => [:create]

  def create
    puts params.inspect
    render :status => 200, :nothing => true
  end

end