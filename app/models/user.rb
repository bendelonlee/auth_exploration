class User < ApplicationRecord
  validates_presence_of :name, :password, :email

  validates_uniqueness_of :email


  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user if user && user.password == password
  end
end
