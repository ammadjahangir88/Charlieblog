class AddGroupIdToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :group_id, :integer
  end
end
