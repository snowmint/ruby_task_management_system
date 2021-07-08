class User < ApplicationRecord
  attr_accessor :name, :email
  attr_accessor :current_password

  before_save { username.downcase! }
  before_save { email.downcase! }
  
  #relation
  has_many :tasks, dependent: :destroy
  #validates
  validates :username, :presence => { :message => I18n.t('errors.username_blank') },
                       :uniqueness => { :message => I18n.t('errors.username_uniqueness')}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => { :message => I18n.t('errors.email_blank') },
                    :uniqueness => { :message => I18n.t('errors.email_uniqueness')},
                    :format => { with: VALID_EMAIL_REGEX }

  has_secure_password
  validates_presence_of :password
  validate :password_requirements
  validates :password, confirmation: { case_sensitive: true }
  validate :same_password_is_correct, on: :update
  
  

  #constant
  Rules = { #constant: start with capital letters
    I18n.t('errors.password_no_lowercase')  => /[a-z]+/,
    I18n.t('errors.password_no_uppercase')  => /[A-Z]+/,
    I18n.t('errors.password_no_digit')      => /\d+/
  }

  #method
  def password_requirements
    Rules.each do |message, regex|
      errors.add( :password, message ) unless password.to_s().match( regex )
    end
  end

  def same_password_is_correct
    if !current_password.blank?
      user = User.find_by_id(id)
      if !user.authenticate(current_password)
        errors.add(:current_password, I18n.t('errors.password_diff'))
      end
    end
  end
end