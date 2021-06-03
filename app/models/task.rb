class Task < ApplicationRecord
  belongs_to :user
  has_many :label_map
end
