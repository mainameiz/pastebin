class User
  include Mongoid::Document

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_accessible :email, :password

  has_many :pastes, :dependent => :destroy
end
