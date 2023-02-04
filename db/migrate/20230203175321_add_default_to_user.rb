class AddDefaultToUser < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :photo, 'https://i.pinimg.com/564x/8d/37/15/8d37158759102f6f9e096650053e8494.jpg'
  end
end
