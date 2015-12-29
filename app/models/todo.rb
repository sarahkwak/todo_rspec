class Todo < ActiveRecord::Base
  validates :contents, presence: true
end
