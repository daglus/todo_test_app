class User < ApplicationRecord
  has_many :tasks
  
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :validatable, :confirmable

  validates_presence_of :first_name, :last_name
end
