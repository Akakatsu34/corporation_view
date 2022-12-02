class Corporation < ApplicationRecord
  has_many :bs
  has_many :pls
  has_many :cfs
end
