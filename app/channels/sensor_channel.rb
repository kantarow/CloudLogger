class SensorChannel < ApplicationCable::Channel
  def subscribed
    stream_for Series.find params[:series_id]
  end

  def unsubscribed
  end
end
