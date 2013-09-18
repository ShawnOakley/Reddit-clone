class LinkSub < ActiveRecord::Migration
  def change
    create_table :linksub do |t|
      t.integer :link_id, null: false
      t.integer :sub_id, null: false
  end

  add_index :linksub, :link_id
  add_index :linksub, :sub_id
end

end
