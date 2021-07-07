class User < ApplicationRecord
  #relation
  has_many :tasks, dependent: :destroy
  #validates
  validates :username, :presence => { :message => I18n.t('errors.username_blank') },
                       :uniqueness => { :message => I18n.t('errors.username_uniqueness') }
  
  has_secure_password
  validates_presence_of :password
  validate :password_requirements
  validates :password, confirmation: { case_sensitive: true }
  validate :same_password_is_correct, on: :update
  
  attr_accessor :same_password

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
    if !password.blank?
      user = User.find_by_id(id)
      if !user.authenticate(password)
        errors.add(:password, I18n.t('errors.password_diff'))
      end
    end
  end

end