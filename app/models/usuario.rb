class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  #  devise :database_authenticatable, :registerable,
  #         :recoverable, :rememberable, :trackable, :validatable

  devise :registerable, :authenticatable, :recoverable,
    :rememberable, :trackable, :database_authenticatable
       
  # Setup accessible (or protected) attributes for your model
  attr_accessible :login, :password, :password_confirmation
  # attr_accessible :title, :body

  validates :login, :password, :presence => true

  validates_confirmation_of :password
  validates_uniqueness_of :login

  def to_label
    self.login
  end
end
