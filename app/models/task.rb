class Task < ApplicationRecord
  #relation
  belongs_to :user
  has_many :label_map
  #validates
  validates :user_id, :start_time, :end_time, :task_name, presence: true
  validates :priority, presence: true, numericality: {#['0', 'Urgent'], ['1', 'Highest'], ['2', 'High'], ['3', 'Normal'], ['4', 'Low'], ['5', Lowest]
    greater_than_or_equal_to: 0, less_than_or_equal_to: 5
  }
  validates :status, presence: true, numericality: { #['0', 'Pending'], ['1', 'In progress'], ['2', 'Complete']
    greater_than_or_equal_to: 0, less_than_or_equal_to: 2
  }
  validate :validate_content_with_task_name
  #scope
  scope :filtered, ->(query_params) { Task::Filter.new.filter(self, query_params) }
  #method
  def validate_content_with_task_name
    if ( task_name.present? && content.blank? )
      errors.add(:content, I18n.t('errors.task_name_without_content'))
    end
    if ( task_name.blank? && content.present? )
      errors.add(:task_name, I18n.t('errors.content_without_task_name'))
    end
  end
end
