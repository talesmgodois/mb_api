class JsonWebToken
  JWT_SECRET = "LOOOOOOOOOOOOOOOL"
  @@secret = ENV['JWT_SECRET'] || JWT_SECRET
  def self.encode(payload)
    JWT.encode(payload, @@secret)
  end

  def self.decode(token)
    return HashWithIndifferentAccess.new(JWT.decode(token, @@secret)[0])
  rescue
    nil
  end
end 