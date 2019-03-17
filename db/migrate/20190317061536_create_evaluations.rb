class CreateEvaluations < ActiveRecord::Migration[5.1]
  def change
    create_table :evaluations do |t|
      t.integer :buyer_id
      t.references :micropost, foreign_key: true
      t.integer :value
      t.text :comment

      t.timestamps
    end
  end
end
