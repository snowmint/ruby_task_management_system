class Task < ApplicationRecord
  belongs_to :user
  has_many :label_map
  validates_presence_of :user_id
  validates_presence_of :start_time
  validates_presence_of :end_time
  validates_presence_of :task_name
  validates_presence_of :content
  validates_presence_of :priority
  validates_presence_of :status
  validates_numericality_of :status, :less_than_or_equal_to => 10
  validates_numericality_of :priority, :less_than_or_equal_to => 6
end
