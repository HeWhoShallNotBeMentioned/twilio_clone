class CreateTestMessages < ActiveRecord::Migration
  def change
    create_table :test_messages do |t|
      t.string :to
      t.string :from
      t.string :body
      t.string :status
      t.integer :user_id
      
      t.timestamps null: false
    end
  end
end
