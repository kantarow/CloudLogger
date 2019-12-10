class SensorChannel < ApplicationCable::Channel
  def subscribed
    stream_for current_series
  end

  def unsubscribed
  end

  def publish_data(data)
    broadcast_to(current_series, body: [ data["x"] || DateTime.now, data["y"] ])
    #current_series.datum.create(x: data["x"], y: data["y"])
  end

  private
    def current_series
      Series.find params[:series_id]
    end
end
