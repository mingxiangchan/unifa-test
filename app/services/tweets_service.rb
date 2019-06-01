class TweetsService
  def self.generate_oauth_url
    endpoint = "#{base_url}/oauth/authorize"
    client_id = ENV["FAKE_TWITTER_CLIENT_ID"]

    # according to RFC 6749, set response type to code
    response_type = "code"

    "#{endpoint}?client_id=#{client_id}&response_type=#{response_type}&redirect_uri=#{redirect_uri}"
  end

  def self.obtain_access_token(code)
    # according to RFC 6749, set grant_type to authorization_code
    grant_type = "authorization_code"

    response =
      HTTP.post(
        "#{base_url}/oauth/token",
        :form => {
          code: code,
          client_id: ENV["FAKE_TWITTER_CLIENT_ID"],
          client_secret: ENV["FAKE_TWITTER_CLIENT_SECRET"],
          grant_type: grant_type,
          redirect_uri: redirect_uri,
        },
      )

    results = JSON.parse(response.body.to_s)
    results["access_token"]
  end

  def self.base_url
    "https://arcane-ravine-29792.herokuapp.com"
  end

  def self.redirect_uri
    "http://localhost:3000/oauth/callback"
  end
end
