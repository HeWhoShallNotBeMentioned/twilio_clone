class CreatePhoneBooks < ActiveRecord::Migration
  def change
    create_table :phone_books do |t|
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
