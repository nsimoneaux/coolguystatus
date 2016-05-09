require "sinatra"
require "sinatra/json"
require "net/http"
require "json"


class CoolGuyStatus < Sinatra::Base
  liveURL = "http://stream.coolguyradio.com:80/live"
  get '/status' do
    response = nil
    response = JSON.parse(Net::HTTP.get(URI('http://stream.coolguyradio.com/status-json.xsl')))
    if response["icestats"]["source"][0].length > 4
      json live: true
    else
      json live: false
    end
  end
end