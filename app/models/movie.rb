class Movie < ApplicationRecord
  has_many :generals, dependent: :destroy
  has_many :episodes, dependent: :destroy
  has_many :comments, through: :generals, source: :generalable, source_type: :Comment
  has_many :ratings, through: :generals, source: :generalable, source_type: :Rating
end
