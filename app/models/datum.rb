class Datum < ApplicationRecord
  belongs_to :series

  def x_or_created_at
    x || created_at.strftime("%Y/%m/%d %H:%M:%S")
  end

  def bloadcast_datum
    SeriesChannel.broadcast_to(
      series,
      body: [ x_or_created_at, y ]
    )
  end

  after_create :bloadcast_datum
end
