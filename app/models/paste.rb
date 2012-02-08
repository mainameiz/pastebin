class Paste
  include Mongoid::Document
  include Mongoid::Timestamps 

  field :title
  field :code
  field :language, default: "text"

  belongs_to :user

  attr_accessible :title, :code, :language

  validates :code, presence: true
  validates :title, :length => { :maximum => 45 }
  validates :language, presence: true
end  
