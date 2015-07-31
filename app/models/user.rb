class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def initialize(args=nil)
    raise "Cannot directly instantiate the abstract User class" if self.class == User
    super
  end

  def admin?
    false
  end
end
