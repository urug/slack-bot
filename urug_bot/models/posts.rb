require 'net/http'

module UrugBot
  module Models
    class Posts < SlackRubyBot::MVC::Model::Base
      BASE_URL = "https://www.reddit.com/r/"

      def fetch_posts_for(subreddit, sort_by)
        uri = URI("https://www.reddit.com/r/#{subreddit}/#{sort_by}.json")
        JSON.parse(Net::HTTP.get(uri))
      end

      def posts_from_response(response)
        response['data']['children'].first(3).map do |post|
          {
            url:          post.dig('data', 'url'),
            title:        post.dig('data', 'title'),
            score:        post.dig('data', 'score'),
            permalink:    post.dig('data', 'permalink'),
            self_post:    post.dig('data', 'is_self'),
            body:         post.dig('data', 'self_text'),
            subreddit:    post.dig('data', 'subreddit'),
            num_comments: post.dig('data', 'num_comments'),
            created_at:   post.dig('data', 'created_utc'),
            thumbnail:    unescape_url(post.dig('data', 'thumbnail')),
            image_url:    unescape_url(post.dig('data', 'preview', 'images')&.first&.dig('source', 'url')),
          }
        end
      end

      def unescape_url(url)
        CGI.unescapeHTML(url.to_s)
      end
    end
  end
end
