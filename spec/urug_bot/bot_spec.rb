require 'spec_helper'

describe UrugBot::Bot do
  def app
    UrugBot::Bot.instance
  end

  subject { app }

  it_behaves_like 'a slack ruby bot'
end
