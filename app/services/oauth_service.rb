class OauthService
  def self.generate_url
    endpoint = "https://arcane-ravine-29792.herokuapp.com/oauth/authorize"
    client_id = ENV["FAKE_TWITTER_CLIENT_ID"]
    # according to RFC 6749, set response type to code
    response_type = "code"
    redirect_uri = "http://localhost:3000/oauth/callback"

    "#{endpoint}?client_id=#{client_id}&response_type=#{response_type}&redirect_uri=#{redirect_uri}"
  end
end
