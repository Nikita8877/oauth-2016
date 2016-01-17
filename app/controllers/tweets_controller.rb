class TweetsController < ApplicationController
  before_action :set_client

  def create
    @client.update("test")
    redirect_to root_path
  end

  def index
    render text: @client.status(688643367601844228).text
  end

  private

  def set_client
    if current_user
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV["TW_KEY"]
        config.consumer_secret     = ENV["TW_SECRET"]
        config.access_token        = current_user.token
        config.access_token_secret = current_user.secret
      end
    else
      redirect_to root_path
    end
  end
end