class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :authorId
      t.integer :postId
      t.string :text
      t.date :updatedAt
      t.date :createdAt

      t.timestamps
    end
    add_index :comments, :authorId
    add_index :comments, :postId
  end
end
