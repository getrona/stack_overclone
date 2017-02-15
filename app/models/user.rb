require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  has_many :questions
  has_many :answers, as: :answerable
  validates :name, :password, :presence => true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def add_view
    self.profile_views = self.profile_views + 1
  end

  def self.authenticate(name, password)
    user = User.where(name: name).first
    if user.password == password
      user
    else
      nil
    end
  end
end
