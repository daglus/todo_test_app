class Task < ApplicationRecord
  belongs_to :user

  validates_presence_of :title, :description, :priority, :due_date
end
