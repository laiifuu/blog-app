class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :posts, table_name: :likes do |t|
      t.timestamps
    end
  end
end
