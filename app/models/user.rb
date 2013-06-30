class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation
  has_secure_password

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save do |user|
    user.email = email.downcase
    user.first_name = first_name.capitalize
    user.last_name = last_name.capitalize
  end

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true,
            :length => { :maximum => 100 },
            :format => { :with => EMAIL_REGEX },
            :uniqueness => { :case_sensitive => false }
  validates :password, :presence => true,
            :length => { :minimum => 6 }
  validates :password_confirmation, :presence => true

  def name
    first_name + " " + last_name
  end
end
