class Series < ApplicationRecord
  belongs_to :data_logger
  has_many :datum

  validates :name, uniqueness: { scope: :data_logger_id } 

  def most_recent_data
    self.datum.order(created_at: :desc).take&.y || 0
  end

  def to_chart
    {
      name: self.name,
      data: self.datum.map {|d| [d.x_or_created_at, d.y ] }
    }
  end
end
