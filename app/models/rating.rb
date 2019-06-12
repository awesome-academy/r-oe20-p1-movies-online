class Rating < ApplicationRecord
  has_one :general, as: :generalable
  has_one :movie, through: :general, source: :movie
  has_one :user, through: :general, source: :user
end
