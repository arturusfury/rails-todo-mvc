# Item Class
class Item < ApplicationRecord
  belongs_to :list

  validates :name, presence: true

  def complete?
    return true if completed
    false
  end

  def complete!
    self.completed = true
    save
  end

  def incomplete!
    self.completed = false
    save
  end
end
