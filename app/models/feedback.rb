class Feedback

  attr_accessor :from_email, :from_name, :message

  def initialize(name, email, message)
    @from_email = email
    @from_name = name
    @message = message
  end

end