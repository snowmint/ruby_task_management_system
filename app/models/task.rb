class Task < ApplicationRecord
  #relation
  belongs_to :user
  has_many :label_map
  #validates
  validates :user_id, :start_time, :end_time, :task_name, presence: true
  validates :priority, presence: true, numericality: {less_than_or_equal_to: 10}
  validates :status, presence: true, numericality: {less_than_or_equal_to: 6}
  validate :validate_content_with_task_name
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
