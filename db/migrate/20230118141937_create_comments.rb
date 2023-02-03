class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :posts, table_name: :comments do |t|
      t.primary_key :id
      t.text :text
      t.timestamps
    end
  end
end
