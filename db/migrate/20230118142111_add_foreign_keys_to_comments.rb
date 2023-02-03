class AddForeignKeysToComments < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :comments, :users, column: :user_id, on_delete: :cascade
    add_foreign_key :comments, :posts, column: :post_id, on_delete: :cascade
  end
end
