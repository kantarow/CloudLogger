class SeriesChannel < ApplicationCable::Channel
  def subscribed
    stream_for current_series
  end

  def unsubscribed
  end

  private
  def current_series
    Series.find params[:series_id]
  end
end
