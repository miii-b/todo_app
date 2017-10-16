class Task < ActiveRecord::Base
  include RankedModel
  
  ranks :row_order

  mount_uploader :attachment

  has_many :task_tags
  has_many :tags, through: :task_tags
  validates :name, presence: true
  
end
