class AddPosterIdColumnToLinks < ActiveRecord::Migration
  def change
    add_column :links, :poster_id, :integer
    add_index :links, :poster_id
  end
end
