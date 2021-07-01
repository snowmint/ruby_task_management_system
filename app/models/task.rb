class Task < ApplicationRecord
  #relation
  belongs_to :user
  has_many :label_map
  #validates
  validates :user_id, :start_time, :end_time, :task_name, presence: true
  validates :priority, presence: true, numericality: {
    greater_than_or_equal_to: 0, less_than_or_equal_to: 5
  }
  validates :status, presence: true, numericality: {
    greater_than_or_equal_to: 0, less_than_or_equal_to: 2
  }
  validate :validate_content_with_task_name
  #scope
  #scope :by_status, -> status { where(status: status) if status.present? }
  #scope :status, -> (query_params) { where(status: query_params[:status]) }

  #scope :by_priority, -> priority { where(priority: priority) if priority.present? }
  #scope :priority, -> (query_params) { where(priority: query_params[:priority]) }
  
  #scope :by_keyword, -> keyword { where(keyword: keyword) if keyword.present? }
  #scope :keyword, -> (query_params) { where("task_name ILIKE :search", search: "%#{query_params[:keyword]}%") }

  #class method
  def self.by_status(query_params)
    if query_params[:status].present?
      where(status: query_params[:status])
    else
      all
    end
  end

  def self.by_priority(query_params)
    if (query_params[:priority].present?)
      where(priority: query_params[:priority])
    else
      all
    end
  end

  def self.by_keyword(query_params)
    if query_params[:keyword].present?
      where("task_name ILIKE :search", search: "%#{query_params[:keyword]}%")
    else
      all
    end
  end

  def self.filtered(query_params)
    #keyword, priority, status = query_params.values_at(:keyword, :priority, :status)
    #Task.where("task_name ILIKE :search AND priority = :priority AND status = :status", search: "%#{keyword}%", priority: priority, status: status)
    #Task.where("task_name ILIKE :search AND priority = :priority AND status = :status", search: "%#{query_params[:keyword]}%", priority: query_params[:priority], status: query_params[:status])
    Task.by_status(query_params).by_priority(query_params).by_keyword(query_params)
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
