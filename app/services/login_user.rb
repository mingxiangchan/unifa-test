class LoginUser
  # @param identifer [String]
  # @param password [String]
  def initialize(identifier:, password:)
    @user = User.find_or_initialize_by(identifier: identifier)
    @password = password
    @errors = []
  end

  # @return [Array<User, Array<String>>]
  def run
    if @user.new_record?
      create_user
    else
      authenticate_user
    end

    [@user, @errors]
  end

  def create_user
    @user.password = @password
    @user.save

    return unless @user.errors

    @user.errors.full_messages.each do |msg|
      @errors << msg
    end
  end

  def authenticate_user
    if @user.authenticate(@password) == false
      @errors << "Incorrect username or password"
    end
  end
end
