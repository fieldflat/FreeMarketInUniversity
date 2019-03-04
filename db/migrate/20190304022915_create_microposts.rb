class CreateMicroposts < ActiveRecord::Migration[5.1]
  def change
    create_table :microposts do |t|
      t.string :title
      t.text :content
      t.boolean :purchased, default:false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
