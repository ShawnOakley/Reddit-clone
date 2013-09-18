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

  def comments_by_parent_id
    parent_value_hash = {}
    link_comments = Comment.find_all_by_link_id(self.id)
    hash_keys = link_comments.map { |comment| comment.id }

    hash_keys.each do |comment_id|
        hash_values = link_comments.select { |comment| comment_id == comment.parent_id }
        parent_value_hash[key_value] = hash_values
    end
    parent_value_hash
  end


end
