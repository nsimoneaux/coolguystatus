require "sinatra"
require "sinatra/json"
require "net/http"
require "json"


class CoolGuyStatus < Sinatra::Base
  liveURL = "http://stream.coolguyradio.com:80/live"
  get '/' do
    response = nil
    response = JSON.parse(Net::HTTP.get(URI('http://stream.coolguyradio.com/status-json.xsl')))
    if response["icestats"]["source"][0].length > 4
      send_file 'live.html'
    else
      json live: false
    end
  end
end
