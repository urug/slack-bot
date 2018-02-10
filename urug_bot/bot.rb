module UrugBot
  class Bot < SlackRubyBot::Bot
    help do
      title 'Urug Bot'
      desc 'For assisting the members of the Utah Ruby Users Group slack community'

      command 'hello world' do
        desc 'Sample command for initial commit'
      end
    end
  end
end
