module UrugBot
  module Views
    class Posts < SlackRubyBot::MVC::View::Base
      COLORS = ['#008500', '#0050F8', '#FFEC32']
      def display_posts(posts, sort_by, subreddit)
        message = {
          "text": "Here are the first 3 #{sort_by} posts on /r/#{subreddit}",
          "attachments": posts.each_with_index.map do |post, index|
            {
              "fallback": post[:title],
              "color": COLORS[index],
              "title": post[:title],
              "title_link": "http://www.reddit.com#{post[:permalink]}",
              "text": post[:body],
              "thumb_url": post[:thumbnail],
              "footer": "#{post[:self_post] ? 'Self' : 'Link'} posted to /r/#{post[:subreddit]}",
              "footer_icon": "https://www.redditstatic.com/icon.png",
              "ts": post[:created_at],
              "fields": [
                {
                  "title": "Score",
                  "value": post[:score],
                  "short": true
                },
                {
                  "title": "Comments",
                  "value": post[:num_comments],
                  "short": true
                },
                {
                  "title": "Image Link",
                  "value": post[:image_url],
                  "short": false
                }
              ]
            }
          end
        }

        client.web_client.chat_postMessage(channel: data.channel, as_user: true, **message)
      end

      def display_error(error_code)
        case error_code
          when 404
            say(channel: data.channel, text: "Oops! Looks like that subreddit doesn't exist.")
          when 403
            say(channel: data.channel, text: "Oops! Looks like that subreddit is private.")
          when 429
            say(channel: data.channel, text: "Oops! Looks like we've been rate limited. Try again later.")
          else
            say(channel: data.channel, text: "Oops! Looks like we got an unknown error. Try again!")
        end
      end

      def react_wait
        client.web_client.reactions_add(
          name: :hourglass_flowing_sand,
          channel: data.channel,
          timestamp: data.ts,
          as_user: true
        )
      end

      def react_thumbsup
        client.web_client.reactions_add(
          name: :thumbsup,
          channel: data.channel,
          timestamp: data.ts,
          as_user: true
        )
      end

      def unreact_wait
        client.web_client.reactions_remove(
          name: :hourglass_flowing_sand,
          channel: data.channel,
          timestamp: data.ts,
          as_user: true
        )
      end
    end
  end
end




