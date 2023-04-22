class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.string :link, null: false
      t.text :description
      t.string :title, null: false

      t.timestamps
    end
  end
end
