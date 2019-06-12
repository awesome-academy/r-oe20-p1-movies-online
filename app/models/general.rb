class General < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  belongs_to :generalable, polymorphic: true
end
