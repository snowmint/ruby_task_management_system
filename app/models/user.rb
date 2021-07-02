class User < ApplicationRecord
  #relation
  has_many :task
  #validates
  validates :username, :presence => { :message => I18n.t('errors.username_blank') },
                       :uniqueness => { :message => I18n.t('errors.username_uniqueness') }
  validates_presence_of :password
  validate :password_requirements
  validates :password, confirmation: { case_sensitive: true }
  #constant
  Rules = { #constant: start with capital letters
    I18n.t('errors.password_no_lowercase')  => /[a-z]+/,
    I18n.t('errors.password_no_uppercase')  => /[A-Z]+/,
    I18n.t('errors.password_no_digit')      => /\d+/
  }

  #method
  def authenticate(login_params)
    auth_user = User.find_by("username = ? AND password = ?", login_params[:username], login_params[:password]) # login, password are your users table fields…
    if auth_user
      return 1
    else
      return 0
    end
  end

  def password_requirements
    Rules.each do |message, regex|
      errors.add( :password, message ) unless password.match( regex )
    end
  end 

  #validates_format_of :password :with => '/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/', message: 'Need atleast one '   
end
