module UrugBot
  class Bot < SlackRubyBot::Bot
    help do
      title 'Urug Bot'
      desc 'For assisting the members of the Utah Ruby Users Group slack community'

      command 'hello world' do
        desc 'Sample command for initial commit'
      end

      command 'reddit' do
        desc 'Returns back 3 sorted posts for a given subreddit. `@urug-bot reddit <subreddit> <top|new|controversial|rising|hot>`'
      end
    end
  end
end
