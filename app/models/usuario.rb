class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :validatable, :confirmable, :lockable, :timeoutable and :activatable
  devise :registerable, :authenticatable, :recoverable,
         :rememberable, :trackable

  attr_accessible :usuario, :password, :password_confirmation


  validates_presence_of :usuario,:password
  validates_confirmation_of :password

  def to_label
    self.usuario
  end

end
