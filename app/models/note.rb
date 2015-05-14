class Note < ActiveRecord::Base
  belongs_to :user
  scope :ordered, -> { order('created_at DESC') }
  
  validates :title, presence: true
  validates :body, presence: true
  validates :user, presence: true
end
