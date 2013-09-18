class Sub < ActiveRecord::Base
  attr_accessible :name, :moderator_id

  has_many(
  :sub_ids,
  class_name: "LinkSub",
  foreign_key: :sub_id,
  primary_key: :id
  )

  has_many(
  :grouped_links,
  through: :sub_ids,
  source: :links
  )

end
