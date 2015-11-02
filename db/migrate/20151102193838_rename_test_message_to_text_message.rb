class RenameTestMessageToTextMessage < ActiveRecord::Migration
  def change
    rename_table :test_messages, :text_messages
  end
end
