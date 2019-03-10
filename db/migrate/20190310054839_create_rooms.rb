class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.integer :buyer_id
      t.references :micropost, foreign_key: true

      t.timestamps
    end
  end
end
