class DataLogger < ApplicationRecord
  belongs_to :user
  has_many :series
  accepts_nested_attributes_for :series
end
