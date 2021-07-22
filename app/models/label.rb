class Label < ApplicationRecord
  has_many :label_maps
  has_many :tasks, through: :label_maps
  # validates_presence_of :label_name
end
