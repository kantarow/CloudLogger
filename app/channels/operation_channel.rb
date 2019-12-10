class OperationChannel < ApplicationCable::Channel
  def subscribed
    stream_from channel_name
  end

  def unsubscribed
  end

  def operate(data)
    ActionCable.server.broadcast channel_name, body: data["operation"]
  end

  private
    def channel_name
      "operation_channel"
      #"operation_channel:#{params[:data_logger_id]}"
    end
end
