class Sub < ActiveRecord::Base
  attr_accessible :name, :moderator_id

  has_many(
  :links,
  class_name: "Link",
  foreign_key: :sub_id,
  primary_key: :id
  )

  belongs_to(
  :moderator,
  class_name: "User",
  foreign_key: :moderator_id,
  primary_key: :id
  )

end
