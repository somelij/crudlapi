class NewsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "news_channel"
  end

  def unsubscribed
    stop_all_streams
  end
end
