require 'spec_helper'

describe UrugBot::Commands::HelloWorld do
  def app
    SlackMathbot::Bot.instance
  end

  subject { app }

  it 'returns hello world' do
    expect(message: "#{SlackRubyBot.config.user} hello world", channel: 'channel').to respond_with_slack_message('Hello, world!')
  end
end
