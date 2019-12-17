class DataLoggerChannel < ApplicationCable::Channel
  def subscribed
    stream_from current_data_logger
  end

  def unsubscribed
  end

  def add_data(data)
    p current_data_logger
    data.each do |name, values|
      next if name == "action"
      current_data_logger.series.find_by(name: name)&.datum.create(x: values[0], y: values[1])
    end
  end

  def operate(data)
    broadcast_to(
      current_data_logger,
      body: data["operation"]
    )
  end

  private
    def current_data_logger
      if defined? @current_data_logger
        @current_data_logger
      else
        @current_data_logger = DataLogger.find params["data_logger_id"] 
      end
    end
end
