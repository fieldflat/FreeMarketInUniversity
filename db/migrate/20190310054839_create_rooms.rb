class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.references :buyer, foreign_key: true
      t.references :micropost, foreign_key: true

      t.timestamps
    end
  end
end
