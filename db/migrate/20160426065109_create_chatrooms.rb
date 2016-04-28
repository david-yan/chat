class CreateChatrooms < ActiveRecord::Migration
  def change
    create_table :chatrooms do |t|
      t.integer :cid

      t.timestamps null: false
    end

    add_index :chatrooms, :cid, unique: true
  end
end
