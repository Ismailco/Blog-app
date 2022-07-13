class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :author_id
      t.text :title
      t.text :text
      # t.date :created_at
      # t.date :updated_at
      t.integer :comments_counter
      t.integer :likes_counter

      t.timestamps
    end
    add_index :posts, :author_id
  end
end
