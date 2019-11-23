class User < ApplicationRecord
  has_secure_password
  has_many :data_loggers
end
