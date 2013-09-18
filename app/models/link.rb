class Link < ActiveRecord::Base
  attr_accessible :title, :url, :text

  belongs_to(
  :sub,
  class_name: "Sub",
  foreign_key: :sub_id,
  primary_key: :id
  )

  belongs_to(
  :poster,
  class_name: "User",
  foreign_key: :poster_id,
  primary_key: :id
  )
end
