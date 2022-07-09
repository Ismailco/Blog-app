class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :authorId
      t.text :title
      t.text :text
      t.date :createdAt
      t.date :updatedAt
      t.integer :commentsCounter
      t.integer :likesCounter

      t.timestamps
    end
    add_index :posts, :authorId
  end
end
