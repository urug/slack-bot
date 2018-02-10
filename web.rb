require 'sinatra/base'

module UrugBot
  class Web < Sinatra::Base
    get '/' do
      'Utah Ruby Users Group Slackbot'
    end
  end
end
