class Comment < ActiveRecord::Base
  attr_accessible :parent_id, :link_id, :author_id, :body

  validates :link_id, presence: true
  validates :author_id, presence: true
  validates :body, presence: true

  has_many(
  :comments,
  class_name: 'Comment',
  foreign_key: :parent_id,
  primary_key: :id
  )

  belongs_to(
  :comment,
  class_name: 'Comment',
  foreign_key: :parent_id,
  primary_key: :id
  )

  belongs_to(
  :user,
  class_name: 'User',
  foreign_key: :author_id,
  primary_key: :id
  )

end
