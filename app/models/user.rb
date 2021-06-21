class User < ApplicationRecord
  def password_requirements
    rules = {
      "must contain at least one lowercase letter"  => /[a-z]+/,
      "must contain at least one uppercase letter"  => /[A-Z]+/,
      "must contain at least one digit"             => /\d+/
    }
  
    rules.each do |message, regex|
      errors.add( :password, message ) unless password.match( regex )
    end
  end
  
  has_many :task
  validates :name, :presence => {:message => "Can't be blank"},
                   :uniqueness => {:message => "Error: Duplicate Username"}
  validates_presence_of :password
  validate :password_requirements

  #validates_format_of :password :with => '/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/', message: 'Need atleast one '   
end
