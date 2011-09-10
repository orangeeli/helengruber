class User < ActiveRecord::Base
  attr_accessible :name, :login, :email, :password, :password_confirmation
  attr_accessor :password
  
  # callbacks
  before_save :encrypt_password

  # validations
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :login, :on => :create
  validates_uniqueness_of :login
 
  # methods
  def self.authenticate(login, password)
    user = find_by_login(login)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end 

  #private
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

end
