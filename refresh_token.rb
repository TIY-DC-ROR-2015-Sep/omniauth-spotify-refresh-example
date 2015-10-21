require 'httparty'
require 'base64'
require 'pry'

secret_token = File.read("secret").chomp
Encoded = Base64.strict_encode64("9664357146fe44a5a9c0c1247f623e76:#{secret_token}")

def refresh
  HTTParty.post("https://accounts.spotify.com/api/token",
                    query: {
                      grant_type: "refresh_token",
                      refresh_token: "..."
                    },
                    headers: {
                      "Authorization" => "Basic #{Encoded}"
                    })

end

binding.pry
