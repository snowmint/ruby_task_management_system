class Task < ApplicationRecord
  #relation
  belongs_to :user
  has_many :label_map
  has_many :labels, through: :label_map

  #validates
  validates :user_id, :start_time, :end_time, :task_name, presence: true
  validates :priority, presence: true, numericality: {
    greater_than_or_equal_to: 0, less_than_or_equal_to: 5
  }
  validates :status, presence: true, numericality: {
    greater_than_or_equal_to: 0, less_than_or_equal_to: 2
  }
  validate :validate_content_with_task_name

  #class method
  def self.by_status(status)
    status.blank? ? all : where(status: status)
  end

  def self.by_priority(priority)
    priority.blank? ? all : where(priority: priority)
  end

  def self.by_keyword(keyword)
    keyword.blank? ? all : where("task_name ILIKE :search", search: "%#{keyword}%")
  end

  def self.by_user_id(user_id)
    user_id.blank? ? all : where(user_id: user_id)
  end

  def self.filtered(query_params)
    Task.by_user_id(query_params[:user_id]).by_status(query_params[:status]).by_priority(query_params[:priority]).by_keyword(query_params[:keyword])
  end

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
