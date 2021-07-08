class Label < ApplicationRecord
  has_many :label_map
  has_many :tasks, through: :label_map
  validates_presence_of :label_name
  validates_presence_of :num_of_use
end
