class List < ApplicationRecord
  has_many :list_tasks
  has_many :tasks, through: :list_tasks
end
