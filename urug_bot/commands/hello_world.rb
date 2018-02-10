module UrugBot
  module Commands
    class HelloWorld < SlackRubyBot::Commands::Base
      command 'hello world' do |client, data, _match|
        client.say(channel: data.channel, text: 'Hello, world!')
      end
    end
  end
end
