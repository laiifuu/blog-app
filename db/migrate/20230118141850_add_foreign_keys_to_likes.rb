class AddForeignKeysToLikes < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :likes, :users, column: :user_id, on_delete: :cascade
    add_foreign_key :likes, :posts, column: :post_id, on_delete: :cascade    
  end
end
