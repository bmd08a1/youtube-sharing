class UpdatePostsSchema < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :link, :string

    add_column :posts, :video_id, :string, null: false
    add_index :posts, [:user_id, :video_id]

    add_column :posts, :thumbnail_url, :string
    add_column :posts, :embed_html, :string
  end
end
