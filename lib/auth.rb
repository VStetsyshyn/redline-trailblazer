class Auth
  ALGORITHM = 'HS256'.freeze

  def self.encode(payload)
    JWT.encode(
      payload,
      auth_secret,
      ALGORITHM
    )
  end

  def self.decode(token)
    JWT.decode(token, auth_secret, true, {
                 algorithm: ALGORITHM,
                 iss: ENV['ISSUER'],
                 verify_iss: true
               }).first
  rescue StandardError
    nil
  end

  def self.auth_secret
    ENV['AUTH_SECRET']
  end
end
