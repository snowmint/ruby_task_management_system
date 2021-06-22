class LabelMap < ApplicationRecord
  belongs_to :task
  belongs_to :label
  validates_presence_of :task_id
  validates_presence_of :label_id
end
