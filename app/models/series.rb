class Series < ApplicationRecord
  belongs_to :data_logger
  has_many :datum
end
