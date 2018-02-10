require 'urug_bot/controllers/posts_controller'
require 'urug_bot/models/posts'
require 'urug_bot/views/posts'

module UrugBot
  module Commands
    class Posts < SlackRubyBot::Commands::Base
      model = UrugBot::Models::Posts.new
      view = UrugBot::Views::Posts.new
      @controller = UrugBot::Controllers::PostsController.new(model, view)
    end
  end
end
