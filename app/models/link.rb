class Link < ActiveRecord::Base
  attr_accessible :title, :url, :text, :poster_id, :joined_sub_ids

  has_many(
  :link_ids,
  class_name: "LinkSub",
  foreign_key: :link_id,
  primary_key: :id
  )

  has_many(
  :joined_sub,
  through: :link_ids,
  source: :subs
  )
end
