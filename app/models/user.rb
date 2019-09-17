class User < ApplicationRecord
  has_many :tasks, dependent: :destroy

  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :validatable, :confirmable

  validates_presence_of :first_name, :last_name
  validates :first_name, :last_name, length: { minimum: 3 }
end
