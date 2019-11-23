class DataLogger < ApplicationRecord
  belongs_to :user
  has_many :series
end
