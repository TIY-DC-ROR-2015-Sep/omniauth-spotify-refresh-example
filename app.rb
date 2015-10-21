require 'sinatra/base'
require 'omniauth'
require 'omniauth-spotify'

require 'pry'

class SpotToken < Sinatra::Base
  enable :logging
  enable :sessions

  use OmniAuth::Builder do
    provider :spotify, "9664357146fe44a5a9c0c1247f623e76", File.read("secret")
  end

  get "/" do
    erb :home
  end

  get "/auth/spotify/callback" do
    request.env["omniauth.auth"].to_json
  end
end

SpotToken.run!
