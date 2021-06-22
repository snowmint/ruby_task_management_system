class Task < ApplicationRecord
  belongs_to :user
  has_many :label_map
  validates_presence_of :user_id
  validates_presence_of :start_time
  validates_presence_of :end_time
  validates_presence_of :task_name
  validates_presence_of :priority
  validates_presence_of :status
  validates_numericality_of :status, :less_than_or_equal_to => 10
  validates_numericality_of :priority, :less_than_or_equal_to => 6
  
  validate :validate_content_with_task_name
  def validate_content_with_task_name
    if ( task_name.present? && content.blank? )
      errors.add(:content, "Must have content with task title.")
    end
    if ( task_name.blank? && content.present? )
      errors.add(:task_name, "Must have task title with content.")
    end
  end
end
